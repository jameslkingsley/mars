/*
 * Author: Kingsley
 * Adds the given height value to the object/positions current position
 *
 * Arguments:
 * 0: Object or position <OBJECT/POSITION>
 * 1: Height to add to current height <SCALAR>
 *
 * Return Value:
 * New position <POSITION>
 *
 * Example:
 * [myObject, 10] call mars_common_fnc_addHeight;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_object", [], [objNull, []]],
    ["_height", 0, [0]]
];

if (typeName _object == "OBJECT" && {isNull _object}) exitWith {};
if (typeName _object == "ARRAY" && {count _object == 0}) exitWith {};

if (typeName _object == "OBJECT") exitWith {
    private _objectPos = getPosVisual _object;
    _objectPos params ["_axisX","_axisY","_axisZ"];
    _object setPos [_axisX, _axisY, (_axisZ + _height)];
};

_object params ["_axisX","_axisY","_axisZ"];
[_axisX, _axisY, (_axisZ + _height)]