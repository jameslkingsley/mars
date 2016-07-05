/*
 * Author: ACE3 Project, Kingsley
 * Transitions the editor camera vision/view/unit
 *
 * Arguments:
 * 0: Camera mode <NUMBER>
 *   - 0: Free
 *   - 1: Internal
 *   - 2: External
 * 1: Vision mode <NUMBER>
 *   - -2: Normal
 *   - -1: NV
 *   -  0: White hot
 *   -  1: Black hot
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [0,-2] call mars_editor_fnc_transitionCamera
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_newMode",GVAR(camMode)], ["_newVision",GVAR(camVision)]];

private ["_camera"];

_camera = GVAR(camera);

// Preserve camUnit value for consistency when manually changing view
_camera cameraEffect ["internal", "back"];

// Apply the camera zoom
_camera camSetFov GVAR(camZoom);
_camera camCommit 0;

// Agent is switched to in free cam to hide death table and prevent AI chat while allowing icons to draw (also prevents systemChat and unit HUD)
if (isNull GVAR(camAgent)) then {
    GVAR(camAgent) = player;
};

GVAR(camAgent) switchCamera "internal";

if (_newMode in [0,2]) then {
    // Set up camera UI
    showCinemaBorder false;
    cameraEffectEnableHUD true;

    // Handle camera movement
    if (isNil QGVAR(camHandler)) then {
        GVAR(camHandler) = [FUNC(handleCamera), 0] call CBA_fnc_addPerFrameHandler;
        GVAR(pfhArray) pushBackUnique GVAR(camHandler);
    };

    // If new vision isn't available then keep current (unless current also isn't)
    if !(_newVision in GVAR(availableVisions)) then {
        _newVision = GVAR(availableVisions) select ((GVAR(availableVisions) find GVAR(camVision)) max 0);
    };

    // Vision mode applies to free and external cam
    if (_newVision < 0) then {
        false setCamUseTi 0;
        camUseNVG (_newVision >= -1);
    } else {
        true setCamUseTi _newVision;
    };
    
    GVAR(camVision) = _newVision;
};

GVAR(camMode) = _newMode;
