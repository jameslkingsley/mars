/*
 * Author: Kingsley
 * Executes given code with given arguments on the local machine
 * Used by mars_common_fnc_execWhereLocal
 *
 * Arguments:
 * 0: Code <CODE>
 * 1: Arguments <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{systemChat str _this}, [1,2,3,4]] call mars_common_fnc__execLocalCode;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_code", {}],
    ["_args", []]
];

_args call _code;
