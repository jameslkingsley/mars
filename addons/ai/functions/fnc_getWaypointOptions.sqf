/*
 * Author: Kingsley
 * Gets the waypoint options from the configFile for use in context menus
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Context options <ARRAY>
 *
 * Example:
 * [] call mars_ai_fnc_getWaypointOptions;
 *
 * Public: No
 */

#include "script_component.hpp"

private _result = [];
private _addons = "true" configClasses (configFile >> "CfgWaypoints");

{
    private _waypoints = "true" configClasses (_x);
    
    {
        _result pushBack [
            ["displayName", getText (_x >> "displayName")],
            ["icon", getText (_x >> "icon")],
            ["action", format ["[_this, '%2'] call %1", QFUNC(addWaypoint), getText (_x >> "type")]],
            ["requiresPosition", true]
        ];
    } forEach _waypoints;
} forEach _addons;

_result