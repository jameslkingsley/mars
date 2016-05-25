/*
 * Author: Kingsley
 * Returns object underneath the cursor that matches the type search criteria
 *
 * Arguments:
 * 0: Object to ignore at destination (optional) <OBJECT>
 *
 * Return Value:
 * Object <OBJECT>
 *
 * Example:
 * _object = [] call mars_editor_fnc_objectUnderCursor;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_ignoreObj", objNull]];

private _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
private _camPos = getPosASLVisual GVAR(freeCamera);

private _objects = lineIntersectsSurfaces [
    _camPos,
    _worldPos,
    GVAR(freeCamera),
    _ignoreObj,
    true,
    1
];

private _target = objNull;
if !(_objects isEqualTo []) then {
    {
        if ({_obj isKindOf _x} count TYPE_SEARCH > 0 || {_obj in GVAR(placedStaticObjects)}) then {
            _target = _obj;
        } else {
            _nearest = nearestObjects [ASLtoAGL (_x select 0), TYPE_SEARCH, 2];
            _target = _nearest param [0, objNull];
        };

        false
    } count _objects;
} else {
    _nearest = nearestObjects [ASLtoAGL _worldPos, TYPE_SEARCH, 2];
    _target = _nearest param [0, objNull];
};

_target
