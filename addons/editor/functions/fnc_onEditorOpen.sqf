/*
 * Author: Kingsley
 * Handles the editor control creation
 *
 * Arguments:
 * 0: The display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call mars_editor_fnc_onEditorOpen;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

if (ADDON) then {
    [_display] call FUNC(redrawMenus);
};