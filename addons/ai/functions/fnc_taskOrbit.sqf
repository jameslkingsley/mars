/*
 * Author: Kingsley
 * Waypoints the given air vehicle to orbit the given area
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

params ["_args","_height"];
_args params ["_units","_pos"];

private _groups = [_units] call EFUNC(common,unitsToGroups);

{
    [_x, {
        params ["_grp","_pos","_height"];
        [_grp] call EFUNC(common,removeAllWaypoints);
        {if (vehicle _x != _x) then {(vehicle _x) flyInHeight _height}} forEach (units _grp);
        _wp = _grp addWaypoint [_pos, 0];
        _wp setWaypointType "LOITER";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointLoiterRadius 750;
        _wp setWaypointLoiterType "CIRCLE";
    }, [_x, _pos, _height]] call EFUNC(common,execWhereLocal);
} forEach _groups;