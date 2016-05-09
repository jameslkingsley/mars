/*
 * Author: Kingsley
 * Closes all toolbar menus
 *
 * Arguments:
 * 0: Turn the flag off <BOOL>
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

params [["_bool",false]];

{ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl _x)} forEach GVAR(allToolbarMenus);
GVAR(allToolbarMenus) = [];

if (_bool) then {
    [{
        [{
            GVAR(hasClickedOnToolbar) = false;
        }, []] call EFUNC(common,execNextFrame);
    }, []] call EFUNC(common,execNextFrame);
};

GVAR(toolbarMenuOpen) = false;