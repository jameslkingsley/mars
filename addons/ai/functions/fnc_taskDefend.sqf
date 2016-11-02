/*
 * Author: Kingsley
 * Tasks the given groups/units to defend an area
 *
 * Arguments:
 * 0: Selection <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[grpOne, unitOne], [1,2,3]] call mars_ai_fnc_taskDefend;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];
_args params [["_units", []], ["_pos", []]];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

[_units] call FUNC(ungarrison);

if (_broadcast) then {
    private _groups = [_units] call CFUNC(unitsToGroups);
    [QGVAR(taskDefend), [_groups, _pos], _groups] call CBA_fnc_targetEvent;
} else {
    {
        [_x] call CBA_fnc_clearWaypoints;
        [_x, _pos, 200, 2, true] call CBA_fnc_taskDefend;
        
        false
    } count _units;
};
