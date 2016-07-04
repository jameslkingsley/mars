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

params [["_unit", player]];

while {dialog} do {
    closeDialog 0;
};

GETUVAR(GVAR(interface),displayNull) closeDisplay 0;

if (!isNil QGVAR(freeCamera)) then {
    GVAR(freeCamera) cameraEffect ["terminate","back"];
    camDestroy GVAR(freeCamera);
    GVAR(freeCamera) = nil;
};

BIS_fnc_feedback_allowPP = true;

if (!isNil QGVAR(pfh)) then {
    [GVAR(pfh)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfh) = nil;
};

if (!isNil QGVAR(delayedPFH)) then {
    [GVAR(delayedPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(delayedPFH) = nil;
};

if (!isNil QGVAR(camHandler)) then {
    [GVAR(camHandler)] call CBA_fnc_removePerFrameHandler;
    GVAR(camHandler) = nil;
};

if (!isNil QGVAR(testPFH)) then {
    [GVAR(testPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(testPFH) = nil;
};

if (!isNil QGVAR(drawingPFH)) then {
    [GVAR(drawingPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(drawingPFH) = nil;
};

if (!isNil QGVAR(playerKilledHandle)) then {
    _unit removeEventHandler ["Killed", GVAR(playerKilledHandle)];
};

player switchCamera "internal";
GVAR(selection) = [];
GVAR(isSet) = false;

[QGVAR(shutdown), [player]] call CBA_fnc_localEvent;