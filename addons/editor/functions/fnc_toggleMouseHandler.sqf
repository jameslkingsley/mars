/*
 * Author: Kingsley
 * Toggles the mouse handler and any of its control visibility
 *
 * Arguments:
 * 0: Enable <BOOL>
 * 1: Visible <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, true] call mars_editor_fnc_toggleMouseHandler;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_enabled", true, [true]],
    ["_visible", true, [true]]
];

private _display = GETUVAR(GVAR(interface), displayNull);
private _mouseHandler = _display displayCtrl IDC_MOUSEHANDLER;

_mouseHandler ctrlEnable _enabled;
_mouseHandler ctrlShow _visible;
