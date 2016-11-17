/*
 * Author: Kingsley
 * Gets the marker the users mouse may be hovered over
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Marker name <STRING>
 * Empty string if not found
 *
 * Example:
 * [] call mars_editor_fnc_getSelectedMarker;
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(serializedMarkers) isEqualTo []) exitWith {""};

private _closeMarkers = GVAR(serializedMarkers) select {
    private _pos = _x select 3;
    private _screenPos = worldToScreen _pos;

    if !(_screenPos isEqualTo []) then {
        ((_screenPos distance2D GVAR(mousePos)) <= 0.033)
    };
};

_closeMarkers apply {[
    ((worldToScreen (_x param [3, [0,0]])) distance2D GVAR(mousePos)),
    (_x param [0, ""])
]};

_closeMarkers sort true;

((_closeMarkers param [0, []]) param [0, ""])
