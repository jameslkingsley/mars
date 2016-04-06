/*
 * Author: Kingsley
 * Handles left mouse button dragging
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_isActive", true]];

_setPFH = {
    GVAR(movingObjectsPFH) = [{
        {
            _unit = _x;
            _unit allowDamage false;
            _unit enableSimulation false;
            _mousePos = screenToWorld GVAR(mousePos);
            _posDiff = (getPos _unit) vectorDiff (getPos leader _unit);
            
            if (leader group _unit == _unit) then {
                _newPos = _mousePos;
            } else {
                _newPos = (getPos leader _unit) vectorAdd _posDiff;
            };
            
            _unit setPos _newPos;
            
            false
        } count GVAR(movingObjects);
    }, 6, []] call CBA_fnc_addPerFrameHandler;
};

if (_isActive) then {
    if (count GVAR(selection) > 0) then {
        GVAR(movingObjects) = GVAR(selection);
        call _setPFH;
    } else {
        private _worldPos = screenToWorld GVAR(mousePos);
        private _objects = nearestObjects FULL_TYPE_SEARCH;

        if (count _objects > 0) then {
            private _target = (_objects select 0);
            private _color = if (alive _target) then {MARS_SIDECOLOR(side _target)} else {[0,0,0,1]};
            GVAR(cursorOverObjectIsVehicle) = !(_target isKindOf "CAManBase");
            [_target, _color] call FUNC(drawBoundingBox);
            GVAR(movingObjects) pushBack _target;
            call _setPFH;
        };
    };
} else {
    if (!isNil QGVAR(movingObjectsPFH)) then {
        [GVAR(movingObjectsPFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(movingObjectsPFH) = 0;
    };

    {
        (vehicle _x) allowDamage true;
        (vehicle _x) enableSimulation true;
        false
    } count GVAR(movingObjects);
    
    GVAR(movingObjects) = [];
};
