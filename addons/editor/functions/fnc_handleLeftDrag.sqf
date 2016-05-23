/*
 * Author: Kingsley
 * Handles left mouse button dragging
 *
 * Arguments:
 * 0: Anchor object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_handleLeftDrag;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_anchorObject", objNull, [objNull]],
    ["_cancel", false, [false]]
];

if (_cancel) exitWith {
    GVAR(allowDragging) = false;

    if ({isPlayer _x} count GVAR(selection) > 0) exitWith {};

    private _backupPosition = ASLtoATL ([] call FUNC(getSurfaceUnderCursor));

    {
        _x setPosATL (_x getVariable [QGVAR(leftDragFinalPos), _backupPosition]);
        false
    } count GVAR(selection);

    [{
        GVAR(selection) = GVAR(selection) - GVAR(objectsDragging);
        GVAR(objectDragAnchor) = objNull;
        GVAR(objectsDragging) = [];
    }, []] call EFUNC(common,execNextFrame);
};

if (!GVAR(allowDragging)) exitWith {};

if (isNull _anchorObject) then {
    if (count GVAR(selection) == 0) then {
        GVAR(selection) = [([] call FUNC(objectUnderCursor))];
    };

    private _nearest = [GVAR(selection)] call FUNC(getNearestUnderCursor);

    if (isNull _nearest) exitWith {
        GVAR(selection) = [];
    };

    GVAR(objectDragAnchor) = _nearest;
} else {
    if (count GVAR(selection) == 0) then {
        GVAR(selection) = [([] call FUNC(objectUnderCursor))];
    };

    if ({isPlayer _x} count GVAR(selection) > 0) exitWith {};

    GVAR(objectsDragging) = GVAR(selection);

    _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
    _anchorPos = getPosASL GVAR(objectDragAnchor);

    {
        private ["_object", "_position", "_offset", "_newPos", "_boundingPos"];

        _object = _x;
        _position = getPosASL _object;
        _boundingPos = _worldPos vectorDiff _position;

        if (_x != GVAR(objectDragAnchor)) then {
            _offset = _position vectorDiff _anchorPos;
            _newPos = _worldPos vectorAdd _offset;
            _boundingPos = _newPos;
        } else {
            _newPos = _worldPos;
        };

        _finalPosATL = ASLtoATL _newPos;
        _finalPosATL set [2, 0];

        [_object, [side (group _object)] call EFUNC(common,getSideColor), ASLtoAGL _boundingPos] call FUNC(drawBoundingBox);
        _object setVariable [QGVAR(leftDragFinalPos), _finalPosATL];

        false
    } count GVAR(selection);
};
