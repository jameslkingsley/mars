/*
 * Author: Kingsley
 * Sets the waves for the current running mission globally
 *
 * Arguments:
 * 0: Waves level (0 - 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.5] call mars_environment_fnc_setWaves;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (isServer) exitWith {
    params [["_waves", 0, [0]]];
    0 setWaves _waves;
    forceWeatherChange;
};

_this remoteExec [QFUNC(setWaves), REMOTE_SERVER];
