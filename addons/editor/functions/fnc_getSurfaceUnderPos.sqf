/*
 * Author: Kingsley
 * Gets the surface detected underneath the given position in world space
 *
 * Arguments:
 * 0: Position <POSITION ASL>
 * 1: Ignore object (optional) <OBJECT>
 * 2: Ignore object (optional) <OBJECT>
 *
 * Return Value:
 * Surface position ASL <POSITION>
 *
 * Example:
 * _pos = [getPosASL player] call mars_editor_fnc_getSurfaceUnderPos;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_startPos", [], [[]]],
    ["_ignoreObj1", objNull, [objNull]],
    ["_ignoreObj2", objNull, [objNull]]
];

private ["_startPos", "_endPos", "_objects"];

_endPos = [(_startPos select 0), (_startPos select 1), 0];

_objects = lineIntersectsSurfaces [
    _startPos,
    _endPos,
    _ignoreObj1,
    _ignoreObj2,
    true,
    1
];

if (count _objects > 0) exitWith {
    ((_objects select 0) select 0)
};

_startPos