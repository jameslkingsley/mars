/*
 * Author: Kingsley
 * Opens or closes the map based on given bool
 *
 * Arguments:
 * 0: Open or close <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call mars_editor_fnc_openMap;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_state", false, [false]]];

private _display = GETUVAR(GVAR(interface), displayNull);
private _map = _display displayCtrl IDC_MAP;

_map ctrlShow _state;
_map ctrlEnable _state;
GVAR(mapOpen) = _state;

private _mouseHandler = _display displayCtrl IDC_MOUSEHANDLER;
_mouseHandler ctrlEnable !_state;
_mouseHandler ctrlShow !_state;

_map ctrlMapAnimAdd [0, 0.25, GVAR(camPos)];
ctrlMapAnimCommit _map;
