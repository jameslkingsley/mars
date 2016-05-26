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

if (!isServer || {isNull _unit}) exitWith {};

GVAR(zeusModule) = getAssignedCuratorLogic _unit;

if (_giveZeus) then {
    if (isNull GVAR(zeusModule)) then {
        private _moduleGroup = createGroup sideLogic;
        GVAR(zeusModule) = _moduleGroup createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];
        SETVAR(GVAR(zeusModule),Owner,"-1");
        SETVAR(GVAR(zeusModule),Name,"");
        SETVAR(GVAR(zeusModule),Addons,3);
        SETVAR(GVAR(zeusModule),Forced,0);

        _unit assignCurator GVAR(zeusModule);
        publicVariable QGVAR(zeusModule);

        // This is spawned so that it doesn't cause player computers to freeze/lag
        /*[] spawn {
            {GVAR(zeusModule) addCuratorEditableObjects [[_x],true];false} count vehicles;
            {GVAR(zeusModule) addCuratorEditableObjects [[_x],true];false} count (entities "CAManBase");
        };*/
    };
} else {
    if (!isNull GVAR(zeusModule)) then {
        unassignCurator GVAR(zeusModule);
        deleteVehicle GVAR(zeusModule);
        GVAR(zeusModule) = objNull;
        publicVariable QGVAR(zeusModule);
    };
};
