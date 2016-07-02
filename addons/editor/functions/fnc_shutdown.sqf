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
    GVAR(freeCamera) = objNull;
};

BIS_fnc_feedback_allowPP = true;

if (!isNil QGVAR(pfh)) then {
    [GVAR(pfh)] call CBA_fnc_removePerFrameHandler;
};

if (!isNil QGVAR(delayedPFH)) then {
    [GVAR(delayedPFH)] call CBA_fnc_removePerFrameHandler;
};

if (!isNil QGVAR(camHandler)) then {
    [GVAR(camHandler)] call CBA_fnc_removePerFrameHandler;
};

if (!isNil QGVAR(testPFH)) then {
    [GVAR(testPFH)] call CBA_fnc_removePerFrameHandler;
};

if (!isNil QGVAR(drawingPFH)) then {
    [GVAR(drawingPFH)] call CBA_fnc_removePerFrameHandler;
};

if (!isNil QGVAR(playerKilledHandle)) then {
    _unit removeEventHandler ["Killed", GVAR(playerKilledHandle)];
};

GVAR(selection) = [];
GVAR(isSet) = false;