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

// Initalize camera variables
GVAR(camBoom) = 0;
GVAR(camDolly) = [0,0];

// Initalize display variables
GVAR(ctrlKey) = false;
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
[_display] call FUNC(createToolbar);

_display displayAddEventHandler ["MouseButtonDown", {
    TRACE_2("hasClickedOnToolbar","MouseButtonDown",GVAR(hasClickedOnToolbar));
}];
    
_display displayAddEventHandler ["MouseButtonDown", {
    [{
        TRACE_2("hasClickedOnToolbar","MouseButtonUp",GVAR(hasClickedOnToolbar));
        if (!GVAR(hasClickedOnToolbar)) then {
            [] call FUNC(closeToolbarMenus);
            GVAR(hasClickedOnToolbar) = false;
        };
    }, []] call EFUNC(common,execNextFrame);
}];

// Reset interruptions
GVAR(interrupts) = [];

GVAR(pfh) = [{
    // Tagging handler
    if (GVAR(canContext)) then {
        [] call FUNC(handleObjectBoxes);
    };

    // Icons handler
    [] call FUNC(handleObjectIcons);

    // Selection handler
    {
        private _color = [[0,0,0,1], MARS_SIDECOLOR(side _x)] select (alive _x);
        [_x, _color] call FUNC(drawBoundingBox);
        false
    } count GVAR(selection);
    
    ctrlSetFocus controlNull;
}, 0, []] call CBA_fnc_addPerFrameHandler;

player playActionNow "gear";

GVAR(isSet) = true;