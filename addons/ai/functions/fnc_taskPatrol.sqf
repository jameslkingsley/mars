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
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];
_args params [["_units", []], ["_pos", []]];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

if (_broadcast) then {
    private _groups = [_units] call CFUNC(unitsToGroups);
    [QGVAR(taskPatrol), [_groups, _pos], _groups] call CBA_fnc_targetEvent;
} else {
    {
        [_x] call CBA_fnc_clearWaypoints;
        [_x, _pos, 200, 7, "MOVE", "AWARE", "RED", "FULL", "LINE", "this spawn CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
        
        false
    } count _units;
};
