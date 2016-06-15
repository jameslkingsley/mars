/*
 * Author: Kingsley
 * Selects a group icon in 3D space
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Group or grpNull if not found <GROUP>
 *
 * Example:
 * _group = [] call mars_editor_fnc_selectGroupIcon;
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(groupIcons) isEqualTo []) exitWith {grpNull};

private _closeIcons = GVAR(groupIcons) select {
    _x params [
        ["_iconPos", [0,0,0]],
        ["_group", grpNull]
    ];

    private _screenIconPos = worldToScreen _iconPos;

    if !(_screenIconPos isEqualTo []) then {
        ((_screenIconPos distance2D GVAR(mousePos)) <= 0.033)
    };
};

_closeIcons apply {[
    ((worldToScreen (_x param [0, [0,0]])) distance2D GVAR(mousePos)),
    (_x param [1, grpNull])
]};

_closeIcons sort true;

((_closeIcons param [0, [-1, grpNull]]) param [1, grpNull])