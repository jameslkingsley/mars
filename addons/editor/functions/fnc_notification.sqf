/*
 * Author: Kingsley
 * Displays a notification in the editor interface
 *
 * Arguments:
 * 0: Text to show <STRING>
 * 1: Color of background (if number passed, 0 = error, 1 = warning, 2 = success) (defaults to 2) <RGBA ARRAY, NUMBER>
 * 2: Time to show message for (in seconds) (defaults to auto) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Hello World", [1,1,0,0.5], 8] call mars_editor_fnc_notification;
 * ["Hello World", 0, 2] call mars_editor_fnc_notification;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_text", "", [""]],
    ["_color", 1, [0, []]],
    ["_delay", -1, [0]]
];

if (_color isEqualType 0) then {
    _color = [
        [0.815686, 0.266667, 0.215686, 0.9], // Error
        [0.8, 0.35, 0, 0.9], // Warning
        [0.12549, 0.505882, 0.313726, 0.9] // Success
    ] select _color;
};

//--- Init notification
private _display = findDisplay IDC_DISPLAY;
private _ctrlNotification = _display displayCtrl IDC_NOTIFICATION;

//--- Measure single line height
_ctrlNotification ctrlSetStructuredText parseText "Mars is better than Zeus";
private _ctrlNotificationTextHeight = ctrlTextHeight _ctrlNotification;

//--- Apply custom appearance
_ctrlNotification ctrlSetStructuredText parseText _text;
_ctrlNotification ctrlSetBackgroundColor _color;
private _ctrlNotificationPos = ctrlPosition _ctrlNotification;

//--- Reset position
_ctrlNotificationPos set [3, 0];
_ctrlNotification ctrlSetPosition _ctrlNotificationPos;
_ctrlNotification ctrlCommit 0;

//--- Expand
if (_delay < 0) then {_delay = 2 + (ctrlTextHeight _ctrlNotification / _ctrlNotificationTextHeight)}; //--- Sleep longer for each text line

_ctrlNotificationPos set [3, ctrlTextHeight _ctrlNotification];
_ctrlNotification ctrlSetPosition _ctrlNotificationPos;
_ctrlNotification ctrlCommit 0.15;

//--- Collapse
[{
    params ["_ctrlNotification"];
    private _ctrlNotificationPos = ctrlPosition _ctrlNotification;
    _ctrlNotificationPos set [3, 0];
    _ctrlNotification ctrlSetPosition _ctrlNotificationPos;
    _ctrlNotification ctrlCommit 0.15;
}, [_ctrlNotification], _delay] call CBA_fnc_waitAndExecute;
