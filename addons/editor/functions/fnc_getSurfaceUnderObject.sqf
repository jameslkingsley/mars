/*
 * Author: Kingsley
 * Gets the surface detected underneath the given objects position in world space
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Ignore object (optional) <OBJECT>
 *
 * Return Value:
 * Surface position ASL <POSITION>
 *
 * Example:
 * _pos = [player] call mars_editor_fnc_getSurfaceUnderObject;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_targetObj", objNull, [objNull]],
    ["_ignoreObj", objNull, [objNull]]
];

private ["_startPos", "_endPos", "_objects"];

_startPos = getPosASLVisual _targetObj;
_endPos = [(_startPos select 0), (_startPos select 1), 0];

_objects = lineIntersectsSurfaces [
    _startPos,
    _endPos,
    _targetObj,
    _ignoreObj,
    true,
    1
];

if (count _objects > 0) exitWith {
    ((_objects select 0) select 0)
};

_startPos