/*
 * Author: Kingsley
 * Opens the client menu
 *
 * Arguments:
 * None
 *
 * Return Value:
 * true if loaded, false if not <BOOL>
 *
 * Example:
 * _loaded = [] call armc_clientmenu_fnc_openMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

while {dialog} do {closeDialog 0;};
createDialog QGVAR(clientMenu);
