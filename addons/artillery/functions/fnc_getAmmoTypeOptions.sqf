/*
 * Author: Kingsley
 * 
 *
 * Arguments:
 * 
 *
 * Return Value:
 * 
 *
 * Example:
 * 
 *
 * Public: 
 */

#include "script_component.hpp"

params [["_vehicles", []]];

if (_vehicles isEqualTo []) exitWith {};

_vehicles = _vehicles apply {vehicle _x};

private _ammo = getArtilleryAmmo _vehicles;
private _result = [];

{
    private _classname = _x;
    private _config = (configFile >> "CfgMagazines" >> _classname);
    private _displayName = getText (_config >> "displayName");
    private _totalAmmoCount = 0;
    
    {
        private _ammoCount = (((magazinesAmmo _x) select {(_x select 0) == _classname}) param [0, []]) param [1, 0];
        _totalAmmoCount = _totalAmmoCount + _ammoCount;
    } forEach _vehicles;
    
    private _text = [format ["%1 (%2)", _displayName, _totalAmmoCount], _displayName] select (count _vehicles > 1);
    
    _result pushBack [
        ["displayName", _text],
        ["action", format ["[_this, '%2'] call %1", QFUNC(fireArtillery), _classname]],
        ["requiresPosition", true]
    ];
} forEach _ammo;

_result