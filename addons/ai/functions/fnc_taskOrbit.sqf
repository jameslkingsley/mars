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

params [["_args", []], ["_height", 500], ["_broadcast", false]];
_args params [["_units", []], ["_pos", []]];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

if (_broadcast) then {
    private _groups = [_units] call CFUNC(unitsToGroups);
    [QGVAR(taskOrbit), [[_groups, _pos], _height], _groups] call CBA_fnc_targetEvent;
} else {
    {
        [_x] call CBA_fnc_clearWaypoints;

        {
            if (vehicle _x != _x) then {
                (vehicle _x) flyInHeight _height;
            };
        } forEach (units _x);

        private _wp = _x addWaypoint [_pos, 0];
        _wp setWaypointType "LOITER";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointLoiterRadius (_height * 2);
        _wp setWaypointLoiterType "CIRCLE";
        
        false
    } count _units;
};
