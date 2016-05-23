/*
 * Author: Kingsley
 * Returns object underneath the cursor without performing any fail-safe searches
 *
 * Arguments:
 * 0: Object to ignore at destination (optional) <OBJECT>
 *
 * Return Value:
 * Object <OBJECT>
 *
 * Example:
 * _object = [] call mars_editor_fnc_absoluteObjectUnderCursor;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_ignoreObj", objNull, [objNull]]];

_target = objNull;
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

if (count _objects > 0) then {
    {
        private _obj = _x select 2;

        if ({_obj isKindOf _x} count TYPE_SEARCH > 0 || _obj in GVAR(placedStaticObjects)) then {
            if (true) exitWith {
                _target = _obj;
            };
        };

        false
    } count _objects;
};

_target