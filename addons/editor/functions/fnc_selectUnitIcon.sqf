/*
 * Author: Kingsley
 * Selects a unit icon in 3D space
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Unit object or objNull if not found <OBJECT>
 *
 * Example:
 * _unit = [] call mars_editor_fnc_selectUnitIcon;
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(unitIcons) isEqualTo []) exitWith {objNull};

private _closeIcons = GVAR(unitIcons) select {
    _x params [
        ["_iconPos", [0,0,0]],
        ["_unit", objNull]
    ];

    private _screenIconPos = worldToScreen _iconPos;

    if !(_screenIconPos isEqualTo []) then {
        ((_screenIconPos distance2D GVAR(mousePos)) <= 0.033)
    };
};

_closeIcons apply {[
    ((worldToScreen (_x param [0, [0,0]])) distance2D GVAR(mousePos)),
    (_x param [1, objNull])
]};

_closeIcons sort true;

((_closeIcons param [0, [-1, objNull]]) param [1, objNull])