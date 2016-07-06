/*
 * Author: Kingsley
 * Adds an object to the static vehicle cache
 *
 * Arguments:
 * 0: Object to add <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyNewObject] call mars_editor_fnc_addObjectToStaticCache;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_object", objNull, [objNull, []]]
];

if (_object isEqualType []) then {
    {GVAR(placedStaticObjects) pushBackUnique _x;false} count _object;
} else {
    GVAR(placedStaticObjects) pushBackUnique _object;
};

publicVariable QGVAR(placedStaticObjects);