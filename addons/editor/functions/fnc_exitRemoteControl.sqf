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

GVAR(remoteControlUnit) setVariable ["BIS_fnc_moduleRemoteControl_owner", nil, true];
BIS_fnc_moduleRemoteControl_unit = nil;

GVAR(remoteControlUnit) = objNull;
GVAR(isRemoteControl) = false;

if (!isNil QGVAR(remoteControlRatingHandler)) then {
    player removeEventHandler ["HandleRating", GVAR(remoteControlRatingHandler)];
};

if (_openEditor) then {
    [] call FUNC(openEditor);
};
