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

["EditorOpen"] call CFUNC(localEvent);

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
        
    _display displayAddEventHandler ["MouseButtonDown", {
        [{
            if (!GVAR(hasClickedOnMenuStrip)) then {
                [] call FUNC(closeMenuStripMenus);
                GVAR(hasClickedOnMenuStrip) = false;
            };
        }, []] call CBA_fnc_execNextFrame;
    }];
}, []] call CBA_fnc_execNextFrame;

// Reset interruptions
GVAR(interrupts) = [];

GVAR(drawingMissionEH) = addMissionEventHandler ["Draw3D", {
    // BEGIN_COUNTER(draw3D);
    
    // Tagging handler
    if (!isNull GVAR(prepDragObjectUnderCursor) || !(GVAR(mouse) select 0)) then {
        if (GVAR(canContext) || {!(GVAR(selection) isEqualTo [])}) then {
            [] call FUNC(handleObjectBoxes);
        };
    };

    // Icons handler
    [] call FUNC(handleIcons);
    [] call FUNC(handleLines);
    [] call FUNC(handleLocationIcons);

    // Selection handler
    {
        private _color = [[0,0,0,1], [side group _x] call CFUNC(getSideColor)] select (alive _x);
        private _isDirectionChanging = _x getVariable [QGVAR(isDirectionChanging), false];
        
        if (!_isDirectionChanging) then {
            [_x, _color] call FUNC(drawBoundingBox);
        };

        false
    } count (GVAR(selection) select {!(_x isEqualTo GVAR(prepSurfaceSphere))});
    
    // END_COUNTER(draw3D);
}];

GVAR(pfh) = [{
    // Asset browser placing objects
    [] call FUNC(prepNewObject);
}, 0, []] call CBA_fnc_addPerFrameHandler;
GVAR(pfhArray) pushBackUnique GVAR(pfh);

GVAR(drawingPFH) = [{
    GVAR(serializeDrawingHandle) = [] spawn FUNC(serializeDrawing);
}, 3, []] call CBA_fnc_addPerFrameHandler;
GVAR(pfhArray) pushBackUnique GVAR(drawingPFH);

// GVAR(testPFH) = [{[] call CFUNC(dumpPerformanceCounters)}, 5, []] call CBA_fnc_addPerFrameHandler;
// GVAR(pfhArray) pushBackUnique GVAR(testPFH);

// Close the editor upon death
GVAR(playerKilledHandle) = player addEventHandler ["Killed", {
    params [["_unit", objNull]];
    [_unit] call FUNC(shutdown);
    GVAR(camPos) = [];
}];

// Edit Players
GVAR(editPlayers) = false;

GVAR(isSet) = true;

["EditorOpened"] call CFUNC(localEvent);