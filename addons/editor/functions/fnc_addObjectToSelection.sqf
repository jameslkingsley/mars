/*
 * Author: Kingsley
 * Adds the given object to selection
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call mars_editor_fnc_addObjectToSelection;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_object", objNull, [objNull, []]]
];

if (_object isEqualType []) then {
    {GVAR(selection) pushBackUnique _x;false} count _object;
} else {
    GVAR(selection) pushBackUnique _object;
};
