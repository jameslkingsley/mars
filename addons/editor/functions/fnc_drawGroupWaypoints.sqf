/*
 * Author: Kingsley
 * Draws group waypoints for any one group in editor selection
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_drawGroupWaypoints;
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(selection) isEqualTo []) exitWith {};

private _groups = GVAR(selection) apply {group vehicle _x};
_groups = _groups arrayIntersect _groups;

{
    private _group = _x;
    private _waypoints = waypoints _group;
    private _previousPos = getPosVisual leader _group;

    {
        private _waypoint = _x;
        private _pos = waypointPosition _waypoint;

        _pos set [2, 0.25];

        [_previousPos, _pos, [1,1,1,1]] call CFUNC(drawThickLine3D);

        drawIcon3D [
            QPATHTOF(data\waypoint_ca.paa),
            [1,1,1,1],
            _pos,
            1,
            1,
            0,
            "",
            1,
            0.03,
            "PuristaBold",
            "center"
        ];

        _previousPos = _pos;

        false
    } count _waypoints;
    
    false
} count _groups;
