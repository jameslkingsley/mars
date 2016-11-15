/*
 * Author: Kingsley
 * Handles the cursor helper position
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_handleCursor;
 *
 * Public: No
 */

#include "script_component.hpp"

private _mousePos = getMousePosition;
_mousePos params ["_mouseX","_mouseY"];

#define CURSOR_SIZE 16
#define CURSOR_XY_MOD (pixelW * (CURSOR_SIZE / 2))
#define CURSOR_WH (pixelW * CURSOR_SIZE)

private _cursorHelper = GETUVAR(GVAR(cursorHelper),controlNull);

_cursorHelper ctrlSetPosition [
    _mouseX - CURSOR_XY_MOD,
    _mouseY - CURSOR_XY_MOD,
    CURSOR_WH,
    CURSOR_WH
];

_cursorHelper ctrlCommit 0;