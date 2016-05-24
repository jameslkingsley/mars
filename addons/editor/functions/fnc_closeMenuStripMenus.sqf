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

{ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl _x)} forEach GVAR(allMenuStripMenus);
GVAR(allMenuStripMenus) = [];

if (_bool) then {
    [{
        [{
            GVAR(hasClickedOnMenuStrip) = false;
        }, []] call EFUNC(common,execNextFrame);
    }, []] call EFUNC(common,execNextFrame);
};

GVAR(menuStripMenuOpen) = false;