/*
 * Author: Kingsley
 * Sets the date and time of the mission globally
 * To use the current server value, pass a -1 (per part)
 *
 * Arguments:
 * 0: Year <NUMBER>
 * 1: Month <NUMBER>
 * 2: Day <NUMBER>
 * 3: Hour <NUMBER>
 * 4: Minute <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1997, 2, 15, 18, 24] call mars_environment_fnc_setDateTime;
 * [-1, -1, -1, 18] call mars_environment_fnc_setDateTime;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (isServer) exitWith {
    params [
        ["_year", -1, [0]],
        ["_month", -1, [0]],
        ["_day", -1, [0]],
        ["_hour", -1, [0]],
        ["_minute", -1, [0]]
    ];

    setDate [
        ([date select 0, _year] select (_year != -1)),
        ([date select 1, _month] select (_month != -1)),
        ([date select 2, _day] select (_day != -1)),
        ([date select 3, _hour] select (_hour != -1)),
        ([date select 4, _minute] select (_minute != -1))
    ];
};

_this remoteExec [QFUNC(setDateTime), REMOTE_SERVER];
