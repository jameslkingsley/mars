/*
 * Author: Kingsley
 * Waits for the user to left click on screen and then returns the world position of cursor
 *
 * Arguments:
 * 0: Code to run <CODE>
 * 1: Arguments to pass to the code <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{player setPos (_this select 1)}] call mars_editor_fnc_execScreenToWorldPos;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_code","_args"];

GVAR(isWaitingForLeftClick) = true;

[{GVAR(hasLeftClicked)}, {
    params ["_code","_args"];
    _worldPos = screenToWorld GVAR(mousePos);
    [_args, _worldPos] call _code;
    GVAR(hasLeftClicked) = false;
    GVAR(isWaitingForLeftClick) = false;
}, _this] call EFUNC(common,waitUntilAndExecute);
