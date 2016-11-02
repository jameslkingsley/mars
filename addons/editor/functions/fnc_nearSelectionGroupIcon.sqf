/*
 * Author: Kingsley
 * Checks whether the given 2D screen space coordinates are near any of the given groups
 *
 * Arguments:
 * 0: 2D Coordinates <ARRAY>
 * 1: Objects <ARRAY>
 *
 * Return Value:
 * Near <BOOL>
 *
 * Example:
 * [[0.5, 0.5], [player]] call mars_editor_fnc_nearSelectionGroupIcon;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_pos", [], [[]]], ["_objects", [], [[]]]];

if (GVAR(groupIcons) isEqualTo []) exitWith {false};

private _groups = [_objects] call CFUNC(unitsToGroups);
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

private _found = (_closeIcons param [0, [-1, grpNull]]) param [1, grpNull];

({_x == _found} count _groups > 0)
