/*jsl:option explicit*/
function unreachable_code() {
    var i;
    i = 0;

    /* unreachable because of break */
    while (i < 100) {
        break;
        i += 1; /*warning:unreachable_code*/
    }

    /* unreachable because of continue */
    while (i > 100) {
        continue;
        i += 1; /*warning:unreachable_code*/
    }

    /* unreachable because of return */
    if (i + i < 0) {
        return;
        i = -i; /*warning:unreachable_code*/
    }

    /* unreachable because of throw */
    if (i == 14) {
        throw i;
        i -= 1; /*warning:unreachable_code*/
    }
}
