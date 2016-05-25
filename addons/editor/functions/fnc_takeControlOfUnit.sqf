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

[] call FUNC(shutdown);

_this spawn {
    params ["_unit"];

    sleep 1;

    player remoteControl _unit;
    _unit switchCamera "internal";

    GVAR(remoteControlUnit) = _unit;
    GVAR(isRemoteControl) = true;
};
