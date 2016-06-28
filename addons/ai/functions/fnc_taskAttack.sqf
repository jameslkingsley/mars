/*
 * Author: Kingsley
 * Tasks the given groups/units to attack an area
 *
 * Arguments:
 * 0: Selection <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[grpOne, unitOne], [1,2,3]] call mars_ai_fnc_taskAttack;
 *
 * Public: Yes
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
        [_group, _pos, 200] call CBA_fnc_taskAttack;
    }, [_x, _pos]] call CFUNC(execWhereLocal);
    
    false
} count _groups;