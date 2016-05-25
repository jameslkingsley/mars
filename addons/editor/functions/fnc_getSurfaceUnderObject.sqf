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

private _startPos = getPosASLVisual _targetObj;
private _endPos = [_startPos select 0, _startPos select 1, 0];

private _objects = lineIntersectsSurfaces [
    _startPos,
    _endPos,
    _targetObj,
    _ignoreObj,
    true,
    1
];

if !(_objects isEqualTo []) exitWith {
    (_objects select 0) select 0
};

_startPos
