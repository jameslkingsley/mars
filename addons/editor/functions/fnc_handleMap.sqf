/*
 * Author: Kingsley
 * Handles the main map controls
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Map <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_handleMap;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_display", displayNull],
    ["_ctrlMap", controlNull]
];

_ctrlMap ctrlMapAnimAdd [0, 0.25, GVAR(camPos)];
ctrlMapAnimCommit _ctrlMap;

_ctrlMap ctrlAddEventHandler ["MouseMoving", {
    params [
        ["_ctrlMap", controlNull, [controlNull]],
        ["_xPos", -1, [0]],
        ["_yPos", -1, [0]],
        ["_mouseIn", false, [true]]
    ];

    private _mouseOver = ctrlMapMouseOver _ctrlMap;
    private _rightButton = _ctrlMap getVariable [QGVAR(rightButton), false];

    if (!_rightButton) then {
        if (_mouseIn) then {
            _ctrlMap ctrlMapCursor ["", "Track"];
        } else {
            _ctrlMap ctrlMapCursor ["", "Arrow"];
        };
    };

    if !(_mouseOver isEqualTo []) then {
        _ctrlMap ctrlMapCursor ["", "3DENSelect"];
    };
}];

_ctrlMap ctrlAddEventHandler ["MouseButtonDown", {
    params ["_control", "_button", "_screenPosX", "_screenPosY"];

    if (_button == 0) then {
        _control setVariable [QGVAR(leftButton), true];
        _control setVariable [QGVAR(rightButton), false];

        _control ctrlMapCursor ["", "Track"];
    } else {
        _control ctrlMapCursor ["", "Move"];
        _control setVariable [QGVAR(leftButton), false];
        _control setVariable [QGVAR(rightButton), true];
    };
}];

_ctrlMap ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control", "_button", "_screenPosX", "_screenPosY"];

    _control ctrlMapCursor ["", "Track"];
    _control setVariable [QGVAR(leftButton), false];
    _control setVariable [QGVAR(rightButton), false];
}];

_ctrlMap ctrlAddEventHandler ["Draw", {
    params ["_control"];
    
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

        private _pos = getPosASLVisual _object;

        _color set [3, 1];

        _control drawIcon [
            _icon,
            _color,
            _pos,
            1,
            1,
            0,
            _displayText,
            _shadow,
            0.031
        ];

        false
    } count GVAR(serializedIcons);
}];

GVAR(mapPFH) = [{
    if !(GVAR(mapOpen)) exitWith {};
}, 0, []] call CBA_fnc_addPerFrameHandler;
GVAR(pfhArray) pushBackUnique GVAR(mapPFH);