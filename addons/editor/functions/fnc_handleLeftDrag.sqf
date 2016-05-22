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
    {
        _x allowDamage true;
        _x enableSimulation true;
        false
    } count GVAR(selection);
    
    [{
        //[{
            GVAR(selection) = GVAR(selection) - GVAR(objectsDragging);
            GVAR(objectDragAnchor) = objNull;
            GVAR(objectsDragging) = [];
        //}, []] call EFUNC(common,execNextFrame);
    }, []] call EFUNC(common,execNextFrame);
};

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
    
    GVAR(objectsDragging) = GVAR(selection);
    
    _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
    _anchorPos = getPosASL GVAR(objectDragAnchor);
    
    {
        private ["_object", "_position", "_offset", "_newPos"];
        
        _object = _x;
        
        if (_x != GVAR(objectDragAnchor)) then {
            _position = getPosASL _object;
            _offset = _position vectorDiff _anchorPos;
            _newPos = _worldPos vectorAdd _offset;
        } else {
            _newPos = _worldPos;
        };
        
        _finalPosATL = ASLtoATL _newPos;
        _finalPosATL set [2, 0];
        
        _object allowDamage false;
        _object enableSimulation false;
        _object setPosATL _finalPosATL;
        
        false
    } count GVAR(selection);
};
