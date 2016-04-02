/*
 * Author: Kingsley
 * Closes child context menus
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

{
    ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl _x);
} forEach GVAR(childContextControls);

GVAR(childContextControls) = [];
GVAR(isMouseOverChild) = false;