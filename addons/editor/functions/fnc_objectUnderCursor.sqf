/*
 * Author: Kingsley
 * Returns object underneath the cursor that matches the type search criteria
 *
 * Arguments:
 * 0: Object to ignore at destination (optional) <OBJECT>
 *
 * Return Value:
 * Objects <ARRAY>
 *
 * Example:
 * _object = [] call mars_editor_fnc_objectUnderCursor;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_ignoreObj", objNull]];

private _target = [] call FUNC(selectUnitIcon);

if (isNull _target) then {
    private _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
    private _camPos = getPosASLVisual GVAR(camera);

    private _objects = lineIntersectsSurfaces [
        _camPos,
        _worldPos,
        GVAR(camera),
        _ignoreObj,
        true,
        1
    ];

    if !(_objects isEqualTo []) then {
        {
            private _obj = _x select 2;

            if ({_obj isKindOf _x} count TYPE_SEARCH > 0 || {_obj in GVAR(placedStaticObjects)}) then {
                if (true) exitWith {
                    _target = _obj;
                };
            } else {
                private _nearest = nearestObjects [(ASLtoAGL (_x select 0)), TYPE_SEARCH, 2];
                
                if !(_nearest isEqualTo []) exitWith {
                    _target = _nearest select 0;
                };
            };

            false
        } count _objects;
    } else {
        private _nearest = nearestObjects [(ASLtoAGL _worldPos), TYPE_SEARCH, 2];
        
        if !(_nearest isEqualTo []) then {
            _target = _nearest select 0;
        };
    };
};

vehicle _target