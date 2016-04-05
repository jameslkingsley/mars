/*
 * Author: BourbonWarfare
 * Sets up the Zeus interface
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

private _giveZeus = isNull getAssignedCuratorLogic player;

while {dialog} do {
    closeDialog 0;
};

if (!isNil QEFUNC(editor,shutdown)) then {
    [] call EFUNC(editor,shutdown);
};

if (isNull getAssignedCuratorUnit GVAR(zeusModule) || {player != getAssignedCuratorUnit GVAR(zeusModule)}) then {
    [player, _giveZeus] remoteExecCall [QFUNC(setupZeus), 2];
};

[] spawn {
    sleep 0.5;
    openCuratorInterface;
};