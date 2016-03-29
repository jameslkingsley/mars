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

params ["_object", "_isVehicle"];

if (_object in GVAR(selection)) exitWith {};

if (GVAR(shiftKey) && count GVAR(selection) == 0) exitWith {
    GVAR(selection) = (units (group _object));
};

if (!GVAR(shiftKey)) then {GVAR(selection) = []};

GVAR(selection) pushBack _object;