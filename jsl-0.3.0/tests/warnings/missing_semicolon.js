/*jsl:option explicit*/
function missing_semicolon() {
    /* missing semicolon after return */
    function MissingSemicolonOnReturnStatement() {
        return 0
    } /*warning:missing_semicolon*/

    /* missing semicolon after return */
    /* missing semicolon after lambda */
    function x() {
    	this.y = function() { return 0 } /*warning:missing_semicolon*/
    } /*warning:missing_semicolon*/

    /* missing semicolon after return */
    /* missing semicolon after lambda */
    x.prototype.z = function() {
    	return 1
    } /*warning:missing_semicolon*/
} /*warning:missing_semicolon*/
