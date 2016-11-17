/*
 * Author: Kingsley
 * Handles which context menu to open if any
 *
 * Arguments:
 * None
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

// Prevents opening menus on mission start (for some reason BIS)
if (time < 2) exitWith {};

GVAR(currentMousePos) = GVAR(mousePos);
[] call FUNC(closeContextMenu);
[] call FUNC(createContextMenu);
