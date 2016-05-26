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

private _data = GETVAR(_control,GVAR(toolbarItemData),[]);
if (_data isEqualTo []) exitWith {};

_data params ["_idc", "_tooltipText", "_iconOn", "_iconOff", "_action", "_default", "_status"];

if (_forceEnabled) then {
    _status = false;
};

_control ctrlSetText ([_iconOff, _iconOn] select !_status);
_data set [6, !_status];
SETVAR(_control,GVAR(toolbarItemData),_data);

[!_status] call compile _action;

ctrlSetFocus (GETUVAR(GVAR(interface),displayNull) displayCtrl IDC_MOUSEHANDLER);
