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

if (!isNil QGVAR(camera) && {!isNull GVAR(camera)}) then {
    GVAR(camera) cameraEffect ["terminate","back"];
    camDestroy GVAR(camera);
};

// Return to player view
player switchCamera "internal";

// Disable BI damage effects
BIS_fnc_feedback_allowPP = true;

GVAR(camera) = nil;

[] call FUNC(killPerFrameHandlers);

GVAR(ctrlKey) = nil;
GVAR(altKey) = nil;
GVAR(shiftKey) = nil;
GVAR(heldKeys) = nil;
GVAR(mouse) = nil;
GVAR(mousePos) = nil;

if (!isNil QGVAR(playerKilledHandle)) then {
    _unit removeEventHandler ["Killed", GVAR(playerKilledHandle)];
};

if (_unit == GVAR(initialLoginPlayer)) then {
    GVAR(initialLoginPlayer) = objNull;
    publicVariable QGVAR(initialLoginPlayer);
};

GVAR(selection) = [];
GVAR(isSet) = false;

[QGVAR(shutdown), [player]] call CBA_fnc_localEvent;
