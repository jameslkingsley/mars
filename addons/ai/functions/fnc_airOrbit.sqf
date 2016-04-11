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

TRACE_1("Orbit", _this);

params ["_args","_height"];
_args params ["_units","_pos"];

private _groups = [_units] call EFUNC(common,unitsToGroups);

{
    (vehicle _x) flyInHeight _height;
    false
} count _units;

{
    _wp = _x addWaypoint [_pos, 0];
    _wp setWaypointType "LOITER";
    _wp setWaypointBehaviour "AWARE";
    _wp setWaypointLoiterRadius 750;
    _wp setWaypointLoiterType "CIRCLE";
    
    false
} count _groups;