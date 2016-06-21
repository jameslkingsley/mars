/*
 * Author: Kingsley
 * Executes a control specific function stored in the given controls namespace
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Function name <STRING>
 * 2: Arguments to pass to the function <ARRAY>
 *
 * Return Value:
 * Nothing or function return <ANY>
 *
 * Example:
 * [myControl, "update", [1]] call mars_attributes_fnc_execControlFunction;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_control", controlNull, [controlNull]],
    ["_method", "", [""]],
    ["_args", [], [[]]]
];

if (_method == "" || {isNull _control}) exitWith {};

private _functions = _control getVariable [QGVAR(functions), []];

if (_functions isEqualTo []) exitWith {};

private _exec = {};
private _execConfig = configNull;

{
    _x params ["_name", "_config", "_code"];
    
    if (toLower _name == toLower _method) exitWith {
        _execConfig = _config;
        if (_code isEqualType "") then {
            _exec = compile _code;
        } else {
            _exec = _code;
        };
    };
    
    false
} count _functions;

([_control, _execConfig, _args] call _exec)