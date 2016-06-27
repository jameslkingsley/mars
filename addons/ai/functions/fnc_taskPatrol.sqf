/*
 * Author: Kingsley
 * Tasks the given groups/units to patrol an area
 *
 * Arguments:
 * 0: Units or groups <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[grpOne, unitOne], [1,2,3]] call mars_ai_fnc_taskPatrol;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_units", []],
    ["_pos", []]
];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

private _groups = [_units] call CFUNC(unitsToGroups);

{
    [_x, {
        params ["_group","_pos"];
        [_group] call CBA_fnc_clearWaypoints;
        
        // These parameters need to be set via a settings menu eventually
        [_group, _pos, 200, 7, "MOVE", "AWARE", "RED", "FULL", "LINE", "this spawn CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
    }, [_x, _pos]] call CFUNC(execWhereLocal);
    
    false
} count _groups;