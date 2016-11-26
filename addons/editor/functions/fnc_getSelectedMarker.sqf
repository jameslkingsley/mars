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

private _markerControls = GETUVAR(GVAR(markerControls), []);

if (_markerControls isEqualTo []) exitWith {""};

(((_markerControls select {(_x getVariable [QGVAR(hovered), false])}) param [0, controlNull]) getVariable [QGVAR(marker), ""])
