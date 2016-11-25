/*
 * Author: Kingsley
 * Randomizes the environment
 * Must be called from the server
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_environment_fnc_randomizeEnvironment;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (!isServer) exitWith {};

private _date = [
    random [1982, 2000, 2020],
    random [1, 6, 12],
    random [1, 15, 30],
    random [0, 5, 24],
    random [0, 30, 59]
];

private _hour = _date select 3;
private _isFullMoon = false;

if (_hour > 18 || _hour < 6) then {
    _isFullMoon = true;
    _date = selectRandom ([_date select 0] call FUNC(fullMoonDates));
};

setDate _date;

0 setFog 0;

private _overcast = [random [0, 0.5, 1], 0] select _isFullMoon;
skipTime -24; 86400 setOvercast _overcast; skipTime 24;

0 setFog [
    random [0, 0.033, 0.1],
    random [0, 0.0066, 0.015],
    random [0, 10, 200]
];

0 setWaves random 1;

forceWeatherChange;
