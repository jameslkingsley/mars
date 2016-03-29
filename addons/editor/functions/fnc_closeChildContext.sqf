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
    if ((_x select 4)) then {
        ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl (_x select 0));
    };
} count GVAR(contextControls);