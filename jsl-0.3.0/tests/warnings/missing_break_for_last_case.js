/*jsl:option explicit*/
function missing_break_for_last_case(i) {
    switch (i) {
      default:
        /*missing break at end of switch (without code)*/
    } /*warning:missing_break_for_last_case*/

    /*missing break at end of switch (with code)*/
    switch (i) {
      default:
         i++;
    } /*warning:missing_break_for_last_case*/

    /*ok because of fallthru*/
    switch (i) {
      default:
         /*jsl:fallthru*/
    }
}
