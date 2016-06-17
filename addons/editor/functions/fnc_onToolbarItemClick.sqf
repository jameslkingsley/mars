/*
 * Author: Kingsley
 * Handles toolbar item clicks
 *
 * Arguments:
 * 0: Control that was clicked <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controlNull] call mars_editor_fnc_onToolbarItemClick;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_control", controlNull, [controlNull]],
    ["_forceEnabled", false, [false]]
];

if (isNull _control) exitWith {};

private _data = _control getVariable [QGVAR(toolbarItemData), []];
if (count _data == 0) exitWith {};

_data params ["_idc", "_tooltipText", "_iconOn", "_iconOff", "_action", "_default", "_status", "_isToggle"];

if (_forceEnabled) then {
    _status = false;
};

if (_isToggle) then {
    _control ctrlSetText ([_iconOff,_iconOn] select !_status);
    _data set [6, !_status];
    _control setVariable [QGVAR(toolbarItemData), _data];
};

(!_status) call compile _action;
