/*
 * Author: Kingsley
 * Handles the selection when right-clicking on a position in a context allowed state (right-click waypoints in Zeus)
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: World position <ARRAY>
 * 2: Target (optional) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

private _worldPos = screenToWorld GVAR(mousePos);

if (count GVAR(selection) == 0 || count _worldPos == 0) exitWith {};

private _target = [] call FUNC(objectUnderCursor);

if (_target in GVAR(selection)) then {
    _target = objNull;
};

["selectionToPosition", [_worldPos, GVAR(selection), _target]] call CFUNC(localEvent);
