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

[player, _giveZeus] remoteExec [QFUNC(setupZeus), REMOTE_SERVER];

if (_giveZeus) then {
    hintSilent "Press your Zeus key";
    MARS_LOGINFO_1("%1 logged into Zeus", name player);
    [player, ["Mars", ["Log", format ["%1 logged into Zeus", name player]]]] remoteExecCall ["createDiaryRecord", REMOTE_GLOBAL];
} else {
    hintSilent "Logged out of Zeus";
    MARS_LOGINFO_1("%1 logged out of Zeus", name player);
    [player, ["Mars", ["Log", format ["%1 logged out of Zeus", name player]]]] remoteExecCall ["createDiaryRecord", REMOTE_GLOBAL];
};

[{hintSilent ""}, [], 5] call CBA_fnc_waitAndExecute;
