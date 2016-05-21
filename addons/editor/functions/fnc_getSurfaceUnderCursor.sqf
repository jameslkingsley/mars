/*
 * Author: Kingsley
 * Gets the surface detected underneath the cursor position in world space
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Surface position ASL <POSITION>
 *
 * Example:
 * _pos = [] call mars_editor_fnc_getSurfaceUnderCursor;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_worldPos", "_camPos", "_objects"];

_worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
_camPos = getPosASLVisual GVAR(freeCamera);

_objects = lineIntersectsSurfaces [
    _camPos,
    _worldPos,
    GVAR(freeCamera),
    objNull,
    true,
    1
];

if (count _objects > 0) exitWith {
    ((_objects select 0) select 0)
};

_worldPos