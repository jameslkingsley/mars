/*
 * Author: Kingsley
 * Takes control of unit using remote control
 *
 * Arguments:
 * 0: Unit to control <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [targetUnit] call mars_editor_fnc_remoteControl;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_targets", [], [[]]]];

private _target = _targets param [0, objNull];

if (isNull _target) exitWith {};

_target = effectiveCommander _target;

if !(side group _target in [east,west,resistance,civilian]) exitWith {};
if (isPlayer _target) exitWith {};
if (!alive _target) exitWith {};
if (isNull _target) exitWith {};
if !(isNull (_target getVariable ["BIS_fnc_moduleRemoteControl_owner", objnull])) exitWith {};
if (isUAVConnected vehicle _target) exitWith {};

[_target] spawn {
    params ["_target"];
    
    [] call FUNC(shutdown);
    
    BIS_fnc_moduleRemoteControl_unit = _target;
    _target setVariable ["BIS_fnc_moduleRemoteControl_owner", player, true];

    player remoteControl _target;

    if (cameraOn != (vehicle _target)) then {
        (vehicle _target) switchCamera cameraView;
    };

    GVAR(remoteControlRatingHandler) = player addEventHandler ["HandleRating", {0}];
    GVAR(remoteControlUnit) = _target;
    GVAR(isRemoteControl) = true;

    //--- Back to player
    GVAR(rcVehicle) = vehicle _target;
    GVAR(rcVehicleRole) = str assignedVehicleRole _target;

    [{
        if (
            (
                vehicle GVAR(remoteControlUnit) != GVAR(rcVehicle) ||
                {str assignedVehicleRole GVAR(remoteControlUnit) != GVAR(rcVehicleRole)}
            ) &&
            {alive GVAR(remoteControlUnit)}
        ) then {
            player remoteControl GVAR(remoteControlUnit);
            GVAR(rcVehicle) = vehicle GVAR(remoteControlUnit);
            GVAR(rcVehicleRole) = str assignedVehicleRole GVAR(remoteControlUnit);
        };

        (cameraOn == vehicle player) ||
        {!alive GVAR(remoteControlUnit)} ||
        {!alive player}
    }, {
        [] call FUNC(exitRemoteControl);
    }, []] call CBA_fnc_waitUntilAndExecute;
};
