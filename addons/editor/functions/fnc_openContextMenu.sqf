/*
 * Author: Kingsley
 * Opens the context menu and processes the dynamic menus
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call mars_editor_fnc_openContextMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_worldPos"];

_worldPos = screenToWorld GVAR(mousePos);
_objects = nearestObjects [_worldPos, TYPE_SEARCH, 3.5];

if (count _objects > 0) then {
    systemChat str (_objects select 0);
} else {
    // Add waypoint (temporary)
    if (count GVAR(selection) > 0) then {
        {
            _x disableAI "AUTOCOMBAT";
            _x disableAI "SUPPRESSION";
            _x allowFleeing 0;
            _x setBehaviour "AWARE";
            _x setSpeedMode "FULL";
            _x doMove _worldPos;
        } forEach GVAR(selection);
    };
};
