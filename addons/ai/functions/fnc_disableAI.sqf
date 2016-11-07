/*
 * Author: Kingsley
 * Disables/Enables the given AI attribute on the given unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Attribute <STRING>
 * 2: Disable (defaults to true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * Same as doing unit enableAI "PATH"
 * [unit, "PATH", false] call mars_ai_fnc_disableAI;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull, grpNull]],
    ["_attr", "", [""]],
    ["_state", true, [true]]
];

private _units = [];

if (_unit isEqualType objNull) then {
    _units = [_unit];
} else {
    if (_unit isEqualType grpNull) then {
        _units = units _unit;
    };
};

{
    if (_state) then {
        _x disableAI _attr;
    } else {
        _x enableAI _attr;
    };
} forEach _units;
