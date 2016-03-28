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
_objects = nearestObjects [_worldPos, ["Man","LandVehicle","Air"], 5];

if (count _objects > 0) then {
    systemChat str (_objects select 0);
};
