/*conf:-lambda_assign_requires_semicolon*/


/* Test with a simple variable. */
var x = function() {
    return {};
}
var y; /*warning:missing_semicolon*/


function Foo()
{
    this.bar = 10;

    /* Test an assignment to a member. */
    this.setBar = function(bar) {
        this.bar = bar;
    }
}

/* Test an assignment to a prototype. */
Foo.prototype.getBar = function() {
    return this.bar;
}
