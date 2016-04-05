/*
 * Author: BourbonWarfare
 * Sets up the Zeus interface
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Open? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call mars_zeus_fnc_openZeus;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_giveZeus"];

if (!isServer) exitWith {};
if (isNull _unit) exitWith {};

GVAR(zeusModule) = getAssignedCuratorLogic _unit;

if (_giveZeus) then {
    if (isNull GVAR(zeusModule)) then {
        private _moduleGroup = createGroup GVAR(zeusCenter);
        GVAR(zeusModule) = _moduleGroup createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];
        GVAR(zeusModule) setVariable ["Owner", "-1"];
        GVAR(zeusModule) setVariable ["Name", ""];
        GVAR(zeusModule) setVariable ["Addons", 3];
        GVAR(zeusModule) setVariable ["Forced", 0];
        _unit assignCurator GVAR(zeusModule);
        {GVAR(zeusModule) addCuratorEditableObjects [[_x],true];false} count vehicles;
        {GVAR(zeusModule) addCuratorEditableObjects [[_x],true];false} count (entities "CaManBase");
    };
} else {
    if (!isNull GVAR(zeusModule)) then {
        unassignCurator GVAR(zeusModule);
        deleteVehicle GVAR(zeusModule);
    };
};
