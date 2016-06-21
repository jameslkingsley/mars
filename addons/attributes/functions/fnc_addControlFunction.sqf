/*
 * Author: Kingsley
 * Adds a function to the given control
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Control config <CONFIG>
 * 2: Function name <STRING>
 * 3: Function code <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [myControl, "update", {}] call mars_attributes_fnc_addControlFunction;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_control", controlNull, [controlNull]],
    ["_config", configNull, [configNull]],
    ["_name", "", [""]],
    ["_code", {}, ["", {}]]
];

if (isNull _control || {_name == ""}) exitWith {};

private _functions = _control getVariable [QGVAR(functions), []];

_functions pushBack [_name, _config, _code];

_control setVariable [QGVAR(functions), _functions];