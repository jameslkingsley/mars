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
 * _objects = [] call mars_editor_fnc_objectUnderCursor;
 *
 * Public: No
 */

#include "script_component.hpp"

_target = objNull;
private _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
private _distance = GVAR(camPos) distance _worldPos;

/*
[{
    params ["_args","_handle"];
    _args params ["_camPos","_mousePos"];
    
    for "_i" from 0 to 250 do {
        drawLine3D [
            _camPos,
            _mousePos,
            [1,0,1,1]
        ];
    };
}, 0, [GVAR(camPos), _worldPos]] call CBA_fnc_addPerFrameHandler;
*/

private _objects = lineIntersectsObjs [GVAR(camPos), _worldPos, objNull, objNull, true, (32 + 16)];

{
    private _obj = _x;
    
    if ({_obj isKindOf _x} count TYPE_SEARCH > 0) exitWith {
        _target = _obj;
    };
    
    false
} count _objects;

TRACE_3("Found object", _worldPos, _distance, _target);

_target