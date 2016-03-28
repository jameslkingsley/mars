/*
 * Author: joko // Jonas
 * Executes a code once with after the Condition is True, using a PFH
 *
 * Argument:
 * 0: Condition <CODE>
 * 1: Code to execute <CODE>
 * 2: Parameters to run the code with <ARRAY,ANY,NIL>
 *
 * Return value:
 * None
 *
 * Example:
 * [{(_this select 0) == vehicle (_this select 0)}, {(_this select 0) setDamage 1;}, [player]] call mars_common_fnc_waitUntilAndExecute
 *
 * Public: No
 */

#include "script_component.hpp"

GVAR(waitUntilAndExecArray) pushBack _this;
nil
