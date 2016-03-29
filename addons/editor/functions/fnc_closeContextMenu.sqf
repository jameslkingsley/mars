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
    ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl (_x select 0));
    false
} count GVAR(contextControls);

GVAR(tempParentIDC) = -1;
GVAR(contextControls) = [];