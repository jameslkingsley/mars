/*
 * Author: Kingsley
 * Checks if the given objects pass the given exception
 *
 * Arguments:
 * 0: Exception <STRING>
 * 1: Objects <ARRAY>
 *
 * Return Value:
 * Pass or fail <BOOL>
 *
 * Example:
 * ["noPlayers", [player]] call mars_common_fnc_passesException;
 * >>> false
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_name", "", [""]],
    ["_objects", [], [[]]]
];

private _except = (GVAR(exceptions) select {(_x select 0) == _name}) param [0, []];

if (_except isEqualTo []) exitWith {true};

_except params ["_key", "_code"];

(_objects call _code)
