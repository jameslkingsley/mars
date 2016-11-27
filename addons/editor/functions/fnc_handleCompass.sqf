/*
 * Author: Kingsley
 * Handles compass value on status bar
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call mars_editor_fnc_handleCompass;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_display", displayNull]];

#define PADDING 20

private _compass = _display displayCtrl IDC_COMPASS;
private _heading = [direction GVAR(camera), 0] call CFUNC(roundToN);
private _initial = ["N", "NE", "E", "SE", "S", "SW", "W", "NW", "N"] select (floor (_heading / 45));

_compass ctrlSetText format ["%1 %2", _initial, str _heading];
