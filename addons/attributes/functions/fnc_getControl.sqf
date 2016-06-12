/*
 * Author: Kingsley
 * Gets a control from the identifier array
 *
 * Arguments:
 * 0: Identifier key <STRING>
 *
 * Return Value:
 * Control or array of controls <CONTROL/ARRAY>
 *
 * Example:
 * _controls = ["MyAwesomeControl"] call mars_attributes_fnc_getControl;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_key", "", [""]]];

if (_key == "") exitWith {controlNull};

{
    _x params ["_id", "_control"];

    if (toLower _id == toLower _key) exitWith {
        _control
    };

    false
} count GVAR(identifyControls);