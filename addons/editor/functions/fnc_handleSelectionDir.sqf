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
    
    if ({isPlayer _x} count GVAR(selection) > 0 && !GVAR(editPlayers)) exitWith {};

    {
        private _newDir = _x getVariable [QGVAR(leftDirFinalPos), nil];
        _x setVariable [QGVAR(isDirectionChanging), nil];
        
        if (!isNil "_newDir") then {
            [QGVAR(setDir), [_x, _newDir], _x] call CBA_fnc_targetEvent;
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
        _x setVariable [QGVAR(isDirectionChanging), nil];
        
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
    if (GVAR(selection) isEqualTo []) then {
        GVAR(selection) = [([] call FUNC(objectUnderCursor))];
    };

    private _nearest = [GVAR(selection)] call FUNC(getNearestUnderCursor);

    if (isNull _nearest) exitWith {
        GVAR(selection) = [];
    };

    GVAR(objectDirAnchor) = _nearest;
} else {
    if (GVAR(selection) isEqualTo []) then {
        GVAR(selection) = [([] call FUNC(objectUnderCursor))];
    };

    if ({isPlayer _x} count GVAR(selection) > 0 && !GVAR(editPlayers)) exitWith {};
    
    ["select"] call FUNC(setCursor);

    GVAR(objectsDirection) = GVAR(selection);

    private _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
    private _anchorPos = getPosASL GVAR(objectDirAnchor);

    {
        private _object = _x;
        private _positionASL = getPosASL _object;
        private _dir = _positionASL getDir _worldPos;
        
        _object setVariable [QGVAR(leftDirFinalPos), _dir];
        _object setVariable [QGVAR(isDirectionChanging), true];
        
        [_object, [side (group _object)] call EFUNC(common,getSideColor), [0,0,0], _dir] call FUNC(drawBoundingBox);

        false
    } count GVAR(selection);
};
