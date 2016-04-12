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

params ["_units","_pos"];

private _groups = [_units] call EFUNC(common,unitsToGroups);

{
    [_x, {
        params ["_grp","_pos"];
        [_grp] call EFUNC(common,removeAllWaypoints);
        [_grp, _pos, 150, 1, true] call CBA_fnc_taskDefend;
    }, [_x, _pos]] call EFUNC(common,execWhereLocal);
    false
} count _groups;