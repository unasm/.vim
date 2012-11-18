/*jsl:option explicit*/
function missing_default_case() {
    var i, s;

    /*missing default case*/
    switch (i) {
      case 1:
        return 1;
    } /*warning:missing_default_case*/

    /* ambivalence - allow fallthru but don't enforce it */
    switch (i) {
      case 2:
        /*jsl:fallthru*/
      case 3:
        s += 1;
        break;
      default:
        break;
    }

    /* ok - intended use of fallthru */
    switch (i) {
      case 0:
        s += "?";
        /*jsl:fallthru*/
      case 1:
        s += "!";
        break;
      default:
        break;
    }

    /* ok - intended use of fallthru */
    switch(i) {
      case 1:
        try {
            i++;
        }
        catch(e)
        {}
        /*jsl:fallthru*/
      case 2:
        i--;
        break;
      default:
        break;
    }

    return "";
}
