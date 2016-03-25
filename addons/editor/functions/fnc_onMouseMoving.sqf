/*
 * Author: Kingsley
 * Handles the mouse moving event
 *
 * Arguments:
 * <Event handler arguments>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display","_cordX","_cordY","_mouseOver"];

GVAR(cam_mouseMoving) = true;

GVAR(mouseCord) = [_cordX, _cordY];

GVAR(cam_mouseDeltaX) = GVAR(cam_mouseLastX) - _cordX;
GVAR(cam_mouseDeltaY) = GVAR(cam_mouseLastY) - _cordY;

if (GVAR(cam_rightMouseDown) && !GVAR(cam_leftMouseDown)) then {
    GVAR(cam_angleX) = (GVAR(cam_angleX) - (GVAR(cam_mouseDeltaX) * 360));
    GVAR(cam_angleY) = (GVAR(cam_angleY) + (GVAR(cam_mouseDeltaY) * 180)) min 89 max -89;
};

GVAR(cam_mouseLastX) = _cordX;
GVAR(cam_mouseLastY) = _cordY;

systemChat format["cam_mouseLastX: %1", GVAR(cam_mouseLastX)];
systemChat format["cam_mouseLastY: %2", GVAR(cam_mouseLastY)];
