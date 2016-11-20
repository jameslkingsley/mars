/*
 * Author: Kingsley
 * Sets the given groups/units formation
 *
 * Arguments:
 * 0: Formation <STRING>
 * 1: Units or groups <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Line", [group unitA]] call mars_ai_fnc_setFormation;
 * ["Line", [unitA]] call mars_ai_fnc_setFormation;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_formation", "", [""]],
    ["_entities", [], [[]]],
    ["_broadcast", false, [false]]
];

if (_entities isEqualTo []) exitWith {};

if (_broadcast) then {
    _entities = _entities select 0;
    systemChat str _entities;
    private _groups = [_entities] call CFUNC(unitsToGroups);
    {[QGVAR(setFormation), [_formation, [_x]], _x] call CBA_fnc_targetEvent;false} count _groups;
} else {
    private _group = _entities param [0, grpNull];
    _group setFormation _formation;
};
