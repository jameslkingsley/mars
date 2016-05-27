/*
 * Author: Kingsley
 * Sets the overcast of the mission globally
 *
 * Arguments:
 * 0: Overcast (0 - 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.33] call mars_environment_fnc_setOvercast;
 *
 * Public: Yes
 */

#include "script_component.hpp"

TRACE_1("setOvercast", _this);

params [["_overcast", overcast, [0]]];

skipTime -24;
86400 setOvercast _overcast;
skipTime 24;

simulWeatherSync;
forceWeatherChange;
