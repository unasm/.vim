/*jsl:option explicit*/
function bad_backref() {
    /* illegal - one 1 backreference */
    var re = /(.)\2/; /*warning:bad_backref*/
}
