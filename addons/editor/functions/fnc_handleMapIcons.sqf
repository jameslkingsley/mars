/*
 * Author: Kingsley
 * Handles map icons using the map draw event handler
 *
 * Arguments:
 * 0: Map control
 *
 * Return Value:
 * None
 *
 * Example:
 * [map] call mars_editor_fnc_handleMapIcons;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_map", controlNull]];

if (isNull _map || {!GVAR(mapOpen)}) exitWith {};

private _camPosASL = GVAR(camPos);
GVAR(groupIcons) = [];
GVAR(unitIcons) = [];

_map drawIcon [
    QPATHTOF(data\camera_ca.paa),
    [0.255, 0.122, 0.478, 1],
    _camPosASL,
    32,
    32,
    direction GVAR(camera),
    "",
    0,
    0.032
];

{
    _x params [
        "_object",
        ["_icon", ""],
        ["_color", [0,0,0,0]],
        ["_zOffset", 0],
        ["_shadow", 1],
        ["_isGroupMarker", false],
        ["_fixedDistance", GVAR(iconDrawDistance)],
        ["_cursorScale", 0.033],
        ["_displayText", ""]
    ];

    private _pos = getPosVisual _object;
    private _alpha = 0.75;
    private _width = 24;
    private _height = 24;

    if (_object in GVAR(selection)) then {
        _alpha = 1;
        _width = 32;
        _height = 32;
    };

    if (_isGroupMarker) then {
        GVAR(groupIcons) pushBack [_pos, group _object];
    } else {
        GVAR(unitIcons) pushBack [_pos, _object];
    };

    _color set [3, [_alpha, 1] select (_object in GVAR(selection))];

    _map drawIcon [
        _icon,
        _color,
        _pos,
        _width,
        _height,
        0,
        _displayText,
        0,
        0.032
    ];

    false
} count GVAR(serializedIcons);

// Asset browser markers
if (GVAR(abSelectedObject) isEqualTo []) exitWith {};

GVAR(abSelectedObject) params ["_type", "_classname", "_iconPath", "_color"];
private _worldPos = _map ctrlMapScreenToWorld getMousePosition;

_map drawIcon [
    _iconPath,
    _color,
    _worldPos,
    24,
    24,
    0,
    "",
    0,
    0.032
];
