/*
 * Author: Kingsley
 * Removes an exception from the list
 *
 * Arguments:
 * 0: Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["isPlayer"] call mars_common_fnc_removeException;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_name", "", [""]]];

{
    _x params ["_n"];

    if (_n == _name) exitWith {
        GVAR(exceptions) deleteAt _forEachIndex;
    };
} forEach GVAR(exceptions);
