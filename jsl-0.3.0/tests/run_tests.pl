#!/usr/bin/perl

use strict;
use File::Find;
use File::Spec;
use FindBin;

# require a path to jsl
#
if (scalar(@ARGV) != 1) {
	die("Usage: run_tests.pl <path to jsl>\n");
}
my $jsl_path = File::Spec->rel2abs($ARGV[0]);

my $num_tests = 0;
my $num_passed = 0;
sub TestFile {
	/\.(js|htm|html)$/ or return;
	my $filename = $_;

	my $conf_file = ".jsl.conf";

	# open the path being validated
	open(FILE, $filename) or die("Could not open $filename: $!");
	my @contents = <FILE>;

	# look for special configuration directives
	my @conf = grep(s/\/\*conf:([^*]*)\*\//\1\n/g, @contents);
	open(FILE, ">$conf_file") or die("Could not open configuration file $conf_file: $!");
	print FILE join("",@conf);
	close FILE;

	# run the lint
	print "Testing $filename...\n";
	my $results = `$jsl_path --conf $conf_file --process $filename --nologo --nofilelisting --nocontext --nosummary -output-format __LINE__,__ERROR_NAME__`;
	unlink $conf_file;
	die "Error executing $jsl_path" unless defined $results;

	my $this_passed = 1;
	foreach my $result (split("\n", $results)) {
		my ($line, $error) = split(",", $result);
		next unless $error; # for now, skip blank errors (such as inability to open file)

		# some warnings point beyond the end of the file
		$line = scalar(@contents) if $line > scalar(@contents);

		unless ($contents[$line-1] =~ s/\/\*warning:$error\*\///) {
			print "Error in $filename, line $line: $error\n";
			$this_passed = 0;
		}
	}
	for (my $i = 1; $i <= scalar(@contents); $i++) {
		if ($contents[$i-1] =~ /\/\*warning:([^*]*)\*\//) {
			print "Error in $filename, line $i: no $1 warning\n";
			$this_passed = 0;
		}
	}
	close(FILE);

	$num_tests++;
	$num_passed++ if $this_passed;
}

# locate all files in the test folder
#
my @dirs;
push(@dirs, $FindBin::Bin);
print "Searching $FindBin::Bin...\n";
find( sub{TestFile}, '.');

print "Passed $num_passed of $num_tests tests\n";
