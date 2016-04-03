/*
 * Author: Kingsley
 * Shuts down Mars
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_shutdown;
 *
 * Public: No
 */

#include "script_component.hpp"

while {dialog} do {
    closeDialog 0;
};

GETUVAR(GVAR(interface),displayNull) closeDisplay 0;

GVAR(freeCamera) cameraEffect ["terminate","back"];
camDestroy GVAR(freeCamera);

BIS_fnc_feedback_allowPP = true;

[GVAR(pfh)] call CBA_fnc_removePerFrameHandler;
[GVAR(camHandler)] call CBA_fnc_removePerFrameHandler;

if (!isNil QGVAR(contextPosLinePFH)) then {
    [GVAR(contextPosLinePFH)] call CBA_fnc_removePerFrameHandler;
};

GVAR(isSet) = false;