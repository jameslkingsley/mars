/*
 * Author: Kingsley
 * Checks whether the given vehicle has ammo
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Has ammo <BOOL>
 *
 * Example:
 * _hasAmmo = [mortar] call mars_artillery_fnc_hasAmmo;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_vehicle", objNull, [objNull]]];

if (isNull _vehicle) exitWith {false};

private _ammoCount = 0;

{
    _x params ["_class", "_count"];
    _ammoCount = _ammoCount + _count;
} forEach (magazinesAmmo _vehicle);

(_ammoCount > 0)