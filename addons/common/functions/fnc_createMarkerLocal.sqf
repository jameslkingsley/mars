/*
 * Author: Kingsley
 * Creates a local marker on the machine executing this function
 * Intended to be used by the editor markers
 *
 * Arguments:
 * 0: Type <STRING>
 * 1: Name <STRING>
 * 2: Text <STRING>
 * 3: Position <ARRAY>
 * 4: Size <ARRAY>
 * 5: Color <STRING>
 * 6: Alpha <NUMBER>
 * 7: Visible for sides <ARRAY>
 *
 * Return Value:
 * Marker name <STRING>
 *
 * Example:
 * ["mil_dot", "obj1", "Objective", [5,5], [1,1], "ColorBlack", 1, [west, resistance]] call mars_common_fnc_createMarkerLocal;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_type", "Empty", [""]],
    ["_name", "", [""]],
    ["_text", "", [""]],
    ["_pos", [0,0], [[]]],
    ["_size", [1,1], [[]]],
    ["_color", "ColorBlack", [""]],
    ["_alpha", 1, [1]],
    ["_sides", [west, east, resistance, civilian, sideLogic], [[]]]
];

if (_name == "") then {
    _name = ["mars", "marker", round time] joinString "_";
};

if (_name in allMapMarkers) then {
    _name = [_name, round time] joinString "_";
};

private _marker = createMarkerLocal [_name, _pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal _type;
_marker setMarkerColorLocal _color;
_marker setMarkerSizeLocal _size;
_marker setMarkerTextLocal _text;

if (side group player in _sides) then {
    _marker setMarkerAlphaLocal _alpha;
} else {
    _marker setMarkerAlphaLocal 0;
};

_marker
