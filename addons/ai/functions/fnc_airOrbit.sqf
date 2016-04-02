/*
 * Author: Kingsley
 * Waypoints the given air vehicle to orbit the given area
 * Called from context menu
 *
 * Arguments:
 * 0: Units <ARRAY>
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

_curGrp = grpNull;

{
    _grp = group _x;
    
    if (_grp != _curGrp) then {
        _wp = _grp addWaypoint [_pos, 0];
        _wp setWaypointType "LOITER";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointLoiterRadius 750;
        _wp setWaypointLoiterType "CIRCLE";
        
        _curGrp = _grp;
    };
    
    false
} count _units;