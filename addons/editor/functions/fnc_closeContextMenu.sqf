/*
 * Author: Kingsley
 * Closes any open context menu
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
    false
} count (GVAR(parentContextControls) + GVAR(childContextControls));

GVAR(parentContextControls) = [];
GVAR(childContextControls) = [];
GVAR(isMouseOverChild) = false;