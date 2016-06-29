/*
 * Author: Kingsley
 * Makes the given code/string an executable compiled code that can be called with arguments
 * Can handle function names as the string
 *
 * Arguments:
 * 0: Code or string <CODE/STRING>
 *
 * Return Value:
 * Executable code <CODE>
 *
 * Example:
 * _code = ["mars_component_fnc_myFunc"] call mars_common_fnc_makeExecutable;
 * _code = ["_this call {}"] call mars_common_fnc_makeExecutable;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_code", {}, [{}, ""]]];

if (_code isEqualType {}) exitWith {_code};
if (isNil _code) exitWith {compile _code};
if (!isNil _code) exitWith {compile format ["_this call %1", _code]};
