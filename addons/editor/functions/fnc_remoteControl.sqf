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

#define SET_TARGET(T)\
    player remoteControl T;\
    T switchCamera "internal";\
    T addEventHandler ["Killed", {[] call FUNC(exitRemoteControl)}];\
    GVAR(remoteControlRatingHandler) = player addEventHandler ["HandleRating", {0}];\
    GVAR(remoteControlUnit) = T;\
    GVAR(isRemoteControl) = true

_target spawn {
    params ["_target"];
    
    [] call FUNC(shutdown);
    
    if (vehicle _target != _target) then {
        // Is a vehicle
        if (!isNull gunner vehicle _target) then {
            // Prioritise gunner of vehicle
            private _gunner = gunner vehicle _target;
            SET_TARGET(_gunner);
        } else {
            if (!isNull driver vehicle _target) then {
                // Next in priority is driver
                private _driver = driver vehicle _target;
                SET_TARGET(_driver);
            } else {
                if (!isNull commander vehicle _target) then {
                    // Lastly pick commander
                    private _commander = commander vehicle _target;
                    SET_TARGET(_commander);
                };
            };
        };
    } else {
        // Is a man
        SET_TARGET(_target);
    };
};