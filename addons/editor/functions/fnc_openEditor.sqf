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

/*if (GVAR(isRemoteControl)) exitWith {
    objNull remoteControl GVAR(remoteControlUnit);
    player switchCamera "internal";
    GVAR(isRemoteControl) = false;
    GVAR(remoteControlUnit) = objNull;
};*/

if !(hasInterface) exitWith {};
if (GVAR(isSet)) exitWith {};

["EditorOpen"] call EFUNC(common,localEvent);

// Initalize camera variables
GVAR(camBoom) = 0;
GVAR(camDolly) = [0,0];

// Initalize display variables
GVAR(heldKeys) = [];
GVAR(heldKeys) resize 255;
GVAR(mouse) = [false,false];
GVAR(mousePos) = [0.5,0.5];

// Initalize the camera objects
GVAR(freeCamera) = "Camera" camCreate (ASLtoATL GVAR(camPos));

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
    // Tagging handler
    if (GVAR(canContext) || count GVAR(selection) > 0) then {
        [] call FUNC(handleObjectBoxes);
    };

    // Icons handler
    [] call FUNC(handleObjectIcons);

    // Selection handler
    {
        if (_x != GVAR(prepSurfaceSphere)) then {
            private _color = [[0,0,0,1], MARS_SIDECOLOR(side group _x)] select (alive _x);
            [_x, _color] call FUNC(drawBoundingBox);
        };
        
        false
    } count GVAR(selection);
    
    ctrlSetFocus controlNull;
    
    // Status bar - grid position
    (GETUVAR(GVAR(interface),displayNull) displayCtrl IDC_STATUSBAR_GRID) ctrlSetText format["%1", mapGridPosition GVAR(freeCamera)];
    
    // Asset browser placing objects
    [] call FUNC(prepNewObject);
    
    // Handle location icons
    [] call FUNC(handleLocationIcons);
}, 0, []] call CBA_fnc_addPerFrameHandler;

GVAR(delayedPFH) = [{
    // FPS Counter
    (GETUVAR(GVAR(interface),displayNull) displayCtrl IDC_STATUSBAR_FPS) ctrlSetText format["%1 FPS", round diag_fps];
}, 1, []] call CBA_fnc_addPerFrameHandler;

// Close the editor upon death
player addEventHandler ["Killed", {
    [] call FUNC(shutdown);
}];

// Set the cursor to default
[] call FUNC(setCursor);

// player playActionNow "gear";

GVAR(isSet) = true;

["EditorOpened", [_display]] call EFUNC(common,localEvent);