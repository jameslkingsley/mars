/*
 * Author: Kingsley
 * Tasks the given groups/units to attack an area
 *
 * Arguments:
 * 0: Args <ARRAY>
 *    0: Selection <ARRAY>
 *    1: Position <ARRAY>
 * 1: Broadcast <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[[grpOne, unitOne], [1,2,3]], true] call mars_ai_fnc_taskAttack;
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
    {[_x, "attack"] call CFUNC(setGroupStatus)} forEach _groups;
    [QGVAR(taskAttack), [_groups, _pos], _groups] call CBA_fnc_targetEvent;
} else {
    {
        [_x] call CBA_fnc_clearWaypoints;
        [_x, _pos, 200] call CBA_fnc_taskAttack;
        
        false
    } count _units;
};