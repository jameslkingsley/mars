/*
 * Author: Kingsley
 * Returns object underneath the cursor that matches the type search criteria
 *
 * Arguments:
 * None
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

_target = objNull;
private _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
private _camPos = getPosASLVisual GVAR(freeCamera);

[{
    params ["_args","_handle"];
    _args params ["_camPos","_worldPos"];

    drawLine3D [
        ASLtoAGL _camPos,
        ASLtoAGL _worldPos,
        [1,0,1,1]
    ];
}, 0, [_camPos, _worldPos]] call CBA_fnc_addPerFrameHandler;

/*private _objects = lineIntersectsObjs [
    _camPos,
    [_worldPos select 0, _worldPos select 1, 0]_worldPos,
    objNull,
    objNull,
    true,
    (32 + 16)
];*/

/*private _objects = lineIntersectsWith [
    _camPos,
    _worldPos,
    objNull,
    objNull,
    true
];*/

private _objects = lineIntersectsSurfaces [
    _camPos,
    _worldPos,
    objNull,
    objNull,
    true,
    -1
];

//reverse _objects;

TRACE_1("Intersects with objects",_objects);

{
    private _obj = _x select 2;

    if ({_obj isKindOf _x} count TYPE_SEARCH > 0) exitWith {
        _target = _obj;
    };

    false
} count _objects;

_target