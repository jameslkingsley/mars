/*
 * Author: Kingsley
 * Handles the mouse button up event
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
        GVAR(cam_leftMouseDown) = false;
        GVAR(cam_leftMouseUp) = true;
    };
    case 1: {
        // RMB
        GVAR(cam_rightMouseDown) = false;
        GVAR(cam_rightMouseUp) = true;
    };
    case 2: {
       // MMB
       GVAR(cam_middleMouseDown) = false;
       GVAR(cam_middleMouseUp) = true;
    };
};