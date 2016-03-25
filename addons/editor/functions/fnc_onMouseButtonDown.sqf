/*
 * Author: Kingsley
 * Handles the mouse button down event
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

params ["_display","_button","_cordX","_cordY","_shift","_ctrl","_alt"];

switch (_button) do {
    case 0: {
        // LMB
        GVAR(cam_leftMouseDown) = true;
        GVAR(cam_leftMouseUp) = false;
    };
    case 1: {
        // RMB
        GVAR(cam_rightMouseDown) = true;
        GVAR(cam_rightMouseUp) = false;
    };
    case 2: {
       // MMB
       GVAR(cam_middleMouseDown) = true;
       GVAR(cam_middleMouseUp) = false;
    };
};