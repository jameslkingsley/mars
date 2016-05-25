/*
 * Author: ACE3 Project, Kingsley
 * Processes the change in mouse position for the editor camera
 *
 * Arguments:
 * 0: Mouse x coord <NUMBER>
 * 1: Mouse y coord <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [0.5, 0.5] call mars_editor_fnc_handleMouse;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_x","_y"];

GVAR(mouse) params ["_leftButton", "_rightButton"];

GVAR(mousePos) params ["_oldX", "_oldY"];

// Get change in pos
_deltaX = _oldX - _x;
_deltaY = _oldY - _y;

if (_rightButton) then {
    // Pan/Tilt amount should be influnced by zoom level (it should really be exponential)
    _zoomMod = (GVAR(camZoom) * 0.8) max 1;

    SUB(GVAR(camPan),(_deltaX * 360) / _zoomMod);
    GVAR(camTilt) = ((GVAR(camTilt) + ((_deltaY * 180) / _zoomMod)) min 89) max -89;
};

GVAR(mousePos) = [_x, _y];
