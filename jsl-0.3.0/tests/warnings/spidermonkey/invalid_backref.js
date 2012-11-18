/*jsl:option explicit*/
function invalid_backref() {
    /* illegal - \0 is not a valid regex backreference */
    var re = /\0/; /*warning:invalid_backref*/
}
