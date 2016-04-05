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

[] call EFUNC(editor,shutdown);
[player, _giveZeus] remoteExecCall [QFUNC(setupZeus), 2];

[] spawn {
    sleep 1;
    openCuratorInterface;
};