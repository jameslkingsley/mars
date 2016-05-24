/*
 * Author: Kingsley
 * Handles direction of objects in selection
 *
 * Arguments:
 * 0: Anchor object <OBJECT>
 * 1: Invoke update <BOOL>
 * 2: Cancel <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_handleSelectionDir;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_anchorObject", objNull, [objNull]],
    ["_update", false, [false]],
    ["_cancel", false, [false]]
];

if (_update) then {
    GVAR(isDirection) = false;
    [] call FUNC(setCursor);
    
    if ({isPlayer _x} count GVAR(selection) > 0) exitWith {};

    {
        private _newDir = _x getVariable [QGVAR(leftDirFinalPos), nil];
        
        if (!isNil "_newDir") then {
            _x setFormDir _newDir;
            _x setDir _newDir;
        };
        
        false
    } count GVAR(selection);
};

if (_cancel) then {
    GVAR(allowDirection) = false;
    GVAR(isDirection) = false;
    [] call FUNC(setCursor);
    
    {
        _x setVariable [QGVAR(leftDirFinalPos), nil];
        false
    } count GVAR(selection);
    
    [{
        GVAR(selection) = GVAR(selection) - GVAR(objectsDirection);
        GVAR(objectDirAnchor) = objNull;
        GVAR(objectsDirection) = [];
        GVAR(allowDirection) = false;
        GVAR(isDirection) = false;
    }, []] call EFUNC(common,execNextFrame);
};

if (!GVAR(allowDirection) || _cancel) exitWith {};

GVAR(isDirection) = true;

if (isNull _anchorObject) then {
    if (count GVAR(selection) == 0) then {
        GVAR(selection) = [([] call FUNC(objectUnderCursor))];
    };

    private _nearest = [GVAR(selection)] call FUNC(getNearestUnderCursor);

    if (isNull _nearest) exitWith {
        GVAR(selection) = [];
    };

    GVAR(objectDirAnchor) = _nearest;
} else {
    if (count GVAR(selection) == 0) then {
        GVAR(selection) = [([] call FUNC(objectUnderCursor))];
    };

    if ({isPlayer _x} count GVAR(selection) > 0) exitWith {};
    
    ["select"] call FUNC(setCursor);

    GVAR(objectsDirection) = GVAR(selection);

    _worldPos = [GVAR(objectDirAnchor)] call FUNC(getSurfaceUnderCursor);
    _anchorPos = getPosASL GVAR(objectDirAnchor);

    {
        private ["_object", "_positionASL", "_dir"];

        _object = _x;
        _positionASL = getPosASL _object;
        _dir = _positionASL getDir _worldPos;
        _object setVariable [QGVAR(leftDirFinalPos), _dir];
        
        [_object, [side (group _object)] call EFUNC(common,getSideColor), [0,0,0], _dir] call FUNC(drawBoundingBox);

        false
    } count GVAR(selection);
};
