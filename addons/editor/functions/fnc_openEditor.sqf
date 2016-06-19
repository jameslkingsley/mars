/*
 * Author: ACE3 Project, Kingsley
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

if !(hasInterface) exitWith {};
if (GVAR(isSet)) exitWith {};

["EditorOpen"] call EFUNC(common,localEvent);

// Initalize camera variables
GVAR(camBoom) = 0;
GVAR(camDolly) = [0,0];
GVAR(camSpeed) = [QGVAR(camSpeed), CAM_DEFAULT_SPEED] call CFUNC(loadSetting);
GVAR(camZoom) = [QGVAR(camZoom), CAM_DEFAULT_ZOOM] call CFUNC(loadSetting);

// Initalize display variables
GVAR(heldKeys) = [];
GVAR(heldKeys) resize 255;
GVAR(mouse) = [false,false];
GVAR(mousePos) = [0.5,0.5];

// Initalize icon variables
GVAR(iconHoverSize) = [QGVAR(iconHoverSize), ICON_HOVER_SIZE] call CFUNC(loadSetting);
GVAR(iconDrawDistance) = [QGVAR(iconDrawDistance), ICON_FADE_DISTANCE] call CFUNC(loadSetting);

// Initalize the camera objects
if (GVAR(camPos) isEqualTo []) then {
    GVAR(camPos) = ((getPosASL player) vectorAdd [0, 0, 10]);
};

GVAR(freeCamera) = "Camera" camCreate GVAR(camPos);

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

// Create the display
disableSerialization;
_display = (findDisplay 46) createDisplay QGVAR(interface);
[_display] call FUNC(createMenuStrip);
[_display] call FUNC(createToolbar);
    
_display displayAddEventHandler ["MouseButtonDown", {
    [{
        if (!GVAR(hasClickedOnMenuStrip)) then {
            [] call FUNC(closeMenuStripMenus);
            GVAR(hasClickedOnMenuStrip) = false;
        };
    }, []] call EFUNC(common,execNextFrame);
}];

// Status Bar
[] call FUNC(handleStatusBar);

// Invoke the default right-panel state
["rightModes", [controlNull, GVAR(abCurrentMode)]] call FUNC(handlePanelSections);

// Reset interruptions
GVAR(interrupts) = [];

GVAR(pfh) = [{
    BEGIN_COUNTER(marsPFH);
    
    // Tagging handler
    if (GVAR(canContext) || count GVAR(selection) > 0) then {
        [] call FUNC(handleObjectBoxes);
    };

    // Icons handler
    [] call FUNC(handleIcons);
    [] call FUNC(handleLines);

    // Selection handler
    {
        if (_x != GVAR(prepSurfaceSphere)) then {
            private _color = [[0,0,0,1], MARS_SIDECOLOR(side group _x)] select (alive _x);
            [_x, _color] call FUNC(drawBoundingBox);
        };
        
        false
    } count GVAR(selection);
    
    // Status bar - grid position
    (GETUVAR(GVAR(interface),displayNull) displayCtrl IDC_STATUSBAR_GRID) ctrlSetText format["%1", mapGridPosition GVAR(freeCamera)];
    
    // Asset browser placing objects
    [] call FUNC(prepNewObject);
    
    // Handle location icons
    [] call FUNC(handleLocationIcons);
    
    END_COUNTER(marsPFH);
}, 0, []] call CBA_fnc_addPerFrameHandler;

GVAR(delayedPFH) = [{
    // FPS Counter
    (GETUVAR(GVAR(interface),displayNull) displayCtrl IDC_STATUSBAR_FPS) ctrlSetText format["%1 FPS", round diag_fps];
}, 1, []] call CBA_fnc_addPerFrameHandler;

GVAR(drawingPFH) = [{
    [] call FUNC(serializeDrawing);
}, 2, []] call CBA_fnc_addPerFrameHandler;

GVAR(testPFH) = [{
    [] call CFUNC(dumpPerformanceCounters);
}, 5, []] call CBA_fnc_addPerFrameHandler;

// Close the editor upon death
GVAR(playerKilledHandle) = player addEventHandler ["Killed", {
    [] call FUNC(shutdown);
}];

// Set the cursor to default
[] call FUNC(setCursor);

// Edit Players
GVAR(editPlayers) = false;

// player playActionNow "gear";

GVAR(isSet) = true;

["EditorOpened", [_display]] call EFUNC(common,localEvent);