/*
 * Author: Kingsley
 * Prepares a new object from the asset browser
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_prepNewObject;
 *
 * Public: No
 */

#include "script_component.hpp"

if (count GVAR(abSelectedObject) == 0) exitWith {};

GVAR(abSelectedObject) params ["_type","_classname","_iconTex","_color"];

private _worldPos = screenToWorld GVAR(mousePos);
//_worldPos set [2, 1];

drawIcon3D [
    _iconTex,
    _color,
    _worldPos,
    1,
    1,
    0,
    "",
    1,
    0
];