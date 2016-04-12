/*
 * Author: Kingsley
 * Tasks the given groups to patrol at area
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
        [_grp, _pos, 200, 7, "MOVE", "AWARE", "RED", "FULL", "STAG COLUMN", "this spawn CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
    }, [_x, _pos]] call EFUNC(common,execWhereLocal);
    false
} count _groups;