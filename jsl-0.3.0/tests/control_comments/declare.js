/*jsl:option explicit*/
function declare() {
    window.alert('http://www.javascriptlint.com/');
    /*jsl:declare window*/

    /* redeclaration only at local scope */
    var window;/*warning:redeclared_var*/
    var document;
    /*jsl:declare document*//*warning:redeclared_var*/
}

var i = 10
/*jsl:declare sample*//*warning:missing_semicolon*/

/* declare was scoped */
window.alert('JavaScript Lint');/*warning:undeclared_identifier*/

document.write('<a href="http://www.javascriptlint.com/">JavaScript Lint</a>');

/*jsl:declare document*/
function document()/*warning:redeclared_var*/
{
}

/*jsl:declare*//*warning:jsl_cc_not_understood*/
/*jsl:declare variable?*//*warning:jsl_cc_not_understood*/
