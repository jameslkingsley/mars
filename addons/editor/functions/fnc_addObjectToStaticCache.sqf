/*
 * Author: Kingsley
 * Adds an object to the static vehicle cache
 *
 * Arguments:
 * 0: Object to add <OBJECT>
 *
 * Return Value:
 * Nil
 *
 * Example:
 * [MyNewObject] call mars_editor_fnc_addObjectToStaticCache;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_object", objNull, [objNull]]];

if (isNull _object) exitWith {};

GVAR(placedStaticObjects) pushBackUnique _object;

nil