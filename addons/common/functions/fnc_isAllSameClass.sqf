/*
 * Author: Kingsley
 * Checks whether the given array of objects are all the same classname
 *
 * Arguments:
 * 0: Objects <ARRAY>
 *
 * Return Value:
 * All the same classname <BOOL>
 *
 * Example:
 * _areSame = [[u1, u2, u3]] call mars_common_fnc_isAllSameClass;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_objects", [], [[]]]];

if (_objects isEqualTo []) exitWith {false};

private _classes = _objects apply {typeOf _x};
_classes = _classes arrayIntersect _classes;

(count _classes == 1)