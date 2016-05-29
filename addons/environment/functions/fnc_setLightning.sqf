/*
 * Author: Kingsley
 * Sets the lightning for the current running mission globally
 *
 * Arguments:
 * 0: Lightning level (0 - 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.5] call mars_environment_fnc_setLightning;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (isServer) exitWith {
    params [["_lightning", 0, [0]]];
    0 setLightnings _lightning;
    forceWeatherChange;
};

_this remoteExec [QFUNC(setLightning), REMOTE_SERVER];
