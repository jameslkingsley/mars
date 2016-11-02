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
    ["_entities", [], [[]]]
];

_entities = _entities select 0; // Something weird with context menu

private _groups = [_entities] call CFUNC(unitsToGroups);

{
    _x setFormation _formation;

    false
} count _groups;
