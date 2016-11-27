/*
 * Author: Kingsley
 * Sets speed mode
 * Used in context menu
 *
 * Arguments:
 * 0: Mode <STRING>
 * 1: Units <ARRAY>
 * 2: Broadcast <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["FULL", [grp1], true] call mars_ai_fnc_setSpeedMode;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_mode", "", [""]],
    ["_entities", [], [[]]],
    ["_broadcast", false, [false]]
];

if (_entities isEqualTo []) exitWith {};

if (_broadcast) then {
    _entities = _entities select 0;
    private _groups = [_entities] call CFUNC(unitsToGroups);
    {[QGVAR(setSpeedMode), [_mode, [_x]], _x] call CBA_fnc_targetEvent;false} count _groups;
} else {
    private _group = _entities param [0, grpNull];
    _group setSpeedMode _mode;
};
