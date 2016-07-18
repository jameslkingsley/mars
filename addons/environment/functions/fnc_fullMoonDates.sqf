/*
 * Author: Kingsley
 * Returns an array of full moon dates based on the given year
 *
 * Arguments:
 * 0: Year <NUMBER>
 *
 * Return Value:
 * Array of dates for use by setDate <ARRAY>
 *
 * Example:
 * [2002] call mars_environment_fnc_fullMoonDates;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_year", 2016, [0]]];

private _fullMoonPhase = 1;
private _day = 1 / 365;
private _waxing = false;
private _fullMoonDates = [];

for "_i" from -_day to dateToNumber [_year, 12, 31, 23, 59] step _day do {
    private _date = numberToDate [_year, _i];
    private _phase = moonPhase _date;
    
    if (_phase > _fullMoonPhase) then {
        _waxing = true;
    };
    
    if (_waxing) then {
        _waxing = false;
        _fullMoonDates pushBack _date;
    };
    
    _fullMoonPhase = _phase;
};

_fullMoonDates