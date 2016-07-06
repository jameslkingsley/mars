/*
 * Author: Kingsley
 * Gets the nearest given object to the camera
 *
 * Arguments:
 * 0: Objects <ARRAY>
 *
 * Return Value:
 * Nearest object <OBJECT>
 *
 * Example:
 * _nearest = [[obj, obj2]] call mars_editor_fnc_nearestToCamera;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_objects", [], [[]]]];

_objects = _objects apply {[_x distance GVAR(camPos), _x]};
_objects sort true;
_objects = _objects apply {_x select 1};

(_objects param [0, objNull])