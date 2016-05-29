/*
 * Author: Kingsley
 * Sets the rain for the current running mission globally
 *
 * Arguments:
 * 0: Rain level (0 - 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.5] call mars_environment_fnc_setRain;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (isServer) exitWith {
    params [["_rain", 0, [0]]];
    0 setRain _rain;
    forceWeatherChange;
};

_this remoteExec [QFUNC(setRain), REMOTE_SERVER];
