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
private _initial = switch (true) do {
    case (_heading >= 0 && (_heading <= PADDING || _heading >= (360 - PADDING))): {"N"};
    case (_heading >= PADDING && _heading <= (90 - PADDING)): {"NE"};
    case (_heading >= (90 - PADDING) && _heading <= (90 + PADDING)): {"E"};
    case (_heading >= (90 + PADDING) && _heading <= (180 - PADDING)): {"SE"};
    case (_heading >= (180 - PADDING) && _heading <= (180 + PADDING)): {"S"};
    case (_heading >= (180 + PADDING) && _heading <= (270 - PADDING)): {"SW"};
    case (_heading >= (270 - PADDING) && _heading <= (270 + PADDING)): {"W"};
    case (_heading >= (270 + PADDING) && _heading <= (360 - PADDING)): {"NW"};
};

_compass ctrlSetText format ["%1 %2", _initial, str _heading];
