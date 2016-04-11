/*
 * Author: Kingsley
 * Tasks the given groups to defend an area
 *
 * Arguments:
 * 0: Selection <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

TRACE_1("Defend", _this);

params ["_units","_pos"];

private _groups = [_units] call EFUNC(common,unitsToGroups);

{
    [_x, _pos, 200, 1, true] call CBA_fnc_taskDefend;
    false
} count _groups;