/*
 * Author: Kingsley
 * Checks whether the given vehicles are able to fire at the given position
 *
 * Arguments:
 * 0: Vehicles <ARRAY>
 * 1: Magazine class <STRING>
 * 2: Position <ARRAY>
 *
 * Return Value:
 * Can fire at position <BOOL>
 *
 * Example:
 * _canFire = [[mortar], "magazine", getMarkerPos "target"] call mars_artillery_fnc_inRange;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_vehicles", [], [[]]],
    ["_magazine", "", [""]],
    ["_pos", [], [[]]]
];

if (_vehicles isEqualTo [] || {_magazine == ""} || {_pos isEqualTo []}) exitWith {false};

(_pos inRangeOfArtillery [_vehicles, _magazine])