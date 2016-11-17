/*
 * Author: Kingsley
 * Exits remote control
 *
 * Arguments:
 * 0: Open editor on exit <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call mars_editor_fnc_exitRemoteControl;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_openEditor", true, [true]]];

objNull remoteControl GVAR(remoteControlUnit);
player switchCamera "internal";

GVAR(remoteControlUnit) = objNull;
GVAR(isRemoteControl) = false;
BIS_fnc_moduleRemoteControl_unit = nil;

if (!isNil QGVAR(remoteControlRatingHandler)) then {
    player removeEventHandler ["HandleRating", GVAR(remoteControlRatingHandler)];
};

if (_openEditor) then {
    [] call FUNC(openEditor);
};
