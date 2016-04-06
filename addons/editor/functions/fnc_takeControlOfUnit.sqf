/*
 * Author: Kingsley
 * Takes control of unit using remote control
 *
 * Arguments:
 * 
 *
 * Return Value:
 * 
 *
 * Example:
 * 
 *
 * Public: 
 */

#include "script_component.hpp"

if (count _this > 1) exitWith {};

_this spawn {
    [] call FUNC(shutdown);
    
    sleep 1;
    
    player remoteControl (_this select 0);
    (_this select 0) switchCamera "internal";

    GVAR(remoteControlUnit) = (_this select 0);
    GVAR(isRemoteControl) = true;
};