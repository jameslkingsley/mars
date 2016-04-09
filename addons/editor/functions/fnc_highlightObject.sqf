/*
 * Author: Kingsley
 * Highlights the given object and adds it to the selection array
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Is vehicle <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_object", "_isVehicle", "_button"];

switch (_button) do {
    // Left Click
    case 0: {
        if (_object in GVAR(leftSelection)) exitWith {};
        if (GVAR(shiftKey) && count GVAR(leftSelection) == 0) exitWith {
            GVAR(leftSelection) = (units (group _object));
            GVAR(selection) = (units (group _object));
        };
        if (!GVAR(shiftKey)) then {GVAR(leftSelection) = []};
        GVAR(leftSelection) pushBackUnique _object;
        GVAR(selection) pushBackUnique _object;
    };
    
    // Right Click
    case 1: {
        if (_object in GVAR(rightSelection)) exitWith {};
        if (GVAR(shiftKey) && count GVAR(rightSelection) == 0) exitWith {
            GVAR(rightSelection) = (units (group _object));
        };
        if (!GVAR(shiftKey)) then {GVAR(rightSelection) = []};
        GVAR(rightSelection) pushBackUnique _object;
        GVAR(selection) pushBackUnique _object;
    };
};
