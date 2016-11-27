/*
 * Author: Kingsley
 * Sets group behaviour
 * Used in context menu
 *
 * Arguments:
 * 0: Behaviour <STRING>
 * 1: Units <ARRAY>
 * 2: Broadcast <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["SAFE", [grp1], true] call mars_ai_fnc_setBehaviour;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_behaviour", "", [""]],
    ["_entities", [], [[]]],
    ["_broadcast", false, [false]]
];

if (_entities isEqualTo []) exitWith {};

if (_broadcast) then {
    _entities = _entities select 0;
    private _groups = [_entities] call CFUNC(unitsToGroups);
    {[QGVAR(setBehaviour), [_behaviour, [_x]], _x] call CBA_fnc_targetEvent;false} count _groups;
} else {
    private _group = _entities param [0, grpNull];
    _group setBehaviour _behaviour;
};
