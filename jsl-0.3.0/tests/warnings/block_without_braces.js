/*jsl:option explicit*/
/*conf:+block_without_braces*/
function block_without_braces() {
    var i;
    if (i)
        i++; /*warning:block_without_braces*/

    do i--; /*warning:block_without_braces*/
    while (i);

    for (i = 0; i < 10; i++)
        i *= 2; /*warning:block_without_braces*/
}
