/*
 * Author: Kingsley
 * Waypoints the given air vehicles to attack the given position
 * Called from context menu
 *
 * Arguments:
 * 0: Selection <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * Waypoint index <INT>
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
        _wp = _grp addWaypoint [_pos, 0];
        _wp setWaypointType "SAD";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointCombatMode "RED";
    }, [_x, _pos]] call EFUNC(common,execWhereLocal);
    false
} count _groups;