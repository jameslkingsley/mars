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

disableSerialization;

{
    ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl _x);
} count GVAR(childContextControls);

GVAR(childContextControls) = [];
GVAR(isMouseOverChild) = false;
GVAR(isChildContextOpen) = false;