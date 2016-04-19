/*
 * Author: BourbonWarfare
 * Opens the Zeus interface
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_zeus_fnc_openZeus;
 *
 * Public: No
 */

#include "script_component.hpp"

private _curator = getAssignedCuratorUnit GVAR(zeusModule);
if (!isNull _curator && _curator != player) exitWith {};

private _giveZeus = isNull getAssignedCuratorLogic player;

while {dialog} do {
    closeDialog 0;
};

if (!isNil QEFUNC(editor,shutdown)) then {
    [] call EFUNC(editor,shutdown);
};

[player, _giveZeus] remoteExecCall [QFUNC(setupZeus), 2];
hint (["Logged out of Zeus", "Press your Zeus key"] select _giveZeus);

[] spawn {
    uiSleep 10;
    hintSilent "";
};