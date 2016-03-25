/*
 * Author: Kingsley
 * Handles the onFrame event
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

GVAR(camera) setDir GVAR(cam_angleX);
[GVAR(camera), [direction GVAR(camera), GVAR(cam_angleY), 0]] call BIS_fnc_setObjectRotation;
