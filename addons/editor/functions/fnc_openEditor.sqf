/*
 * Author: SilentSpike, Kingsley
 * Opens editor for local client
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_openEditor
 *
 * Public: No
 */

#include "script_component.hpp"

if (!hasInterface) exitWith {};
if (GVAR(isSet)) exitWith {};
if !([player] call FUNC(canLogin)) exitWith {};

// Register player ID in global whitelist
private _uid = getPlayerUID player;
if !(_uid in GVAR(whitelisted)) then {
    if (_uid in GVAR(blacklisted)) then {
        if (true) exitWith {
            MARS_LOGERROR("Your Steam account has been blacklisted. You are unable to login to Mars on this server.");
        };
    } else {
        GVAR(whitelisted) pushBackUnique _uid;
        publicVariable QGVAR(whitelisted);
        MARS_LOGINFO("Logged into Mars.");
    };
};

if (isNil QGVAR(placedStaticObjects)) then {
    GVAR(placedStaticObjects) = [];
    publicVariable QGVAR(placedStaticObjects);
};

if (isNull GVAR(initialLoginPlayer)) then {
    GVAR(initialLoginPlayer) = player;
    publicVariable QGVAR(initialLoginPlayer);
};

[] call FUNC(killPerFrameHandlers);

[QGVAR(EditorOpen)] call CFUNC(localEvent);

// Initalize camera variables
GVAR(camBoom) = 0;
GVAR(camDolly) = [0,0];
GVAR(camSpeed) = [QGVAR(camSpeed), CAM_DEFAULT_SPEED] call CFUNC(loadSetting);
GVAR(camZoom) = [QGVAR(camZoom), CAM_DEFAULT_ZOOM] call CFUNC(loadSetting);

// Initalize display variables
GVAR(ctrlKey) = false;
GVAR(altKey) = false;
GVAR(shiftKey) = false;
GVAR(heldKeys) = [];
GVAR(heldKeys) resize 255;
GVAR(mouse) = [false,false];
GVAR(mousePos) = [0.5,0.5];

// Initalize icon variables
GVAR(iconHoverSize) = [QGVAR(iconHoverSize), ICON_HOVER_SIZE] call CFUNC(loadSetting);
GVAR(iconDrawDistance) = [QGVAR(iconDrawDistance), ICON_FADE_DISTANCE] call CFUNC(loadSetting);

// Initalize the camera object
if (GVAR(camPos) isEqualTo []) then {
    GVAR(camPos) = (getPosASL player) vectorAdd [0, 0, 10];
};

GVAR(camera) = "Camera" camCreate GVAR(camPos);

// Initalize view
[] call FUNC(transitionCamera);

// Close map
openMap [false,false];

// Disable BI damage effects
BIS_fnc_feedback_allowPP = false;

// Close any open dialogs
while {dialog} do {
    closeDialog 0;
};

[{
    disableSerialization;
    // Create the display
    private _display = (findDisplay 46) createDisplay QGVAR(interface);
}, []] call CBA_fnc_execNextFrame;

// Reset interruptions
GVAR(interrupts) = [];

GVAR(pfh) = [{
    BEGIN_COUNTER(onFrame);

    private _display = GETUVAR(GVAR(interface), displayNull);
    GVAR(objectUnderCursor) = [] call FUNC(objectUnderCursor);

    /*private _hotbar = _display displayCtrl IDC_HOTBAR;
    private _hasSelection = !(GVAR(selection) isEqualTo []);
    _hotbar ctrlEnable _hasSelection;
    _hotbar ctrlShow _hasSelection;*/

    // Asset browser placing objects
    [] call FUNC(prepNewObject);
    [_display] call FUNC(updateDebugPanel);

    END_COUNTER(onFrame);
}, 0, []] call CBA_fnc_addPerFrameHandler;
GVAR(pfhArray) pushBackUnique GVAR(pfh);

GVAR(draw3DEH) = addMissionEventHandler ["Draw3D", {
    BEGIN_COUNTER(Draw3D);

    if (!isNull GVAR(prepDragObjectUnderCursor) || {!(GVAR(mouse) select 0)}) then {
        if (GVAR(canContext) || {!(GVAR(selection) isEqualTo [])}) then {
            if (!isNull GVAR(objectUnderCursor)) then {
                [
                    GVAR(objectUnderCursor),
                    (GVAR(objectUnderCursor) getVariable [QGVAR(color), [0,0,0,1]])
                ] call FUNC(drawBoundingBox);
                ["select"] call FUNC(setCursor);
                GVAR(bbOpen) = false;
            } else {
                GVAR(bbOpen) = true;
                if (!GVAR(hoveringOverIcon)) then {
                    [] call FUNC(setCursor);
                };
            };
        };
    };

    [] call FUNC(handleCursor);
    [] call FUNC(updateIcons);
    [] call FUNC(drawGroupWaypoints);

    {
        private _color = (vehicle _x) getVariable [QGVAR(color), [0,0,0,1]];
        [(vehicle _x), _color] call FUNC(drawBoundingBox);
        false
    } count (GVAR(selection) select {
        !((vehicle _x) getVariable [QGVAR(isDirectionChanging), false])
    });

    END_COUNTER(Draw3D);
}];

GVAR(drawingPFH) = [{
    GVAR(serializeIconHandle) = [GETUVAR(GVAR(interface), displayNull)] spawn FUNC(serializeIcons);
    // [] spawn CFUNC(dumpPerformanceCounters);
}, 1.5, []] call CBA_fnc_addPerFrameHandler;
GVAR(pfhArray) pushBackUnique GVAR(drawingPFH);

// Close the editor upon death
GVAR(playerKilledHandle) = player addEventHandler ["Killed", {
    params [["_unit", objNull]];
    [_unit] call FUNC(shutdown);
    GVAR(camPos) = [];
}];

// Edit Players
GVAR(editPlayers) = false;

GVAR(isSet) = true;

[QGVAR(EditorOpened)] call CFUNC(localEvent);
