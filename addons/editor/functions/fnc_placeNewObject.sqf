/*
 * Author: Kingsley
 * Places any selected object from the asset browser
 *
 * Arguments:
 * 0: Ctrl key held <BOOL>
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

params [["_ctrlKeyHeld", false, [false]]];

if (count GVAR(abSelectedObject) == 0) exitWith {};

GVAR(abSelectedObject) params ["_type","_classname","_iconTex","_color", ["_groupPath", []]];

switch (_type) do {
    case "man": {
        _classname = configName (configFile >> "CfgVehicles" >> _classname);
        _sideInt = getNumber (configFile >> "CfgVehicles" >> _classname >> "side");
        _side = [_sideInt] call EFUNC(common,getSideByInt);
        
        [([] call EFUNC(common,getSpawnMachine)), _classname, _type, _side, {
            private ["_object","_worldPos"];
            _object = _this;
            _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
            _object setPosASL _worldPos;
        }] call EFUNC(common,createObjectOnID);
    };
    case "vehicle": {};
    case "group": {
        _groupPath params ["_root", "_side", "_faction", "_type", "_group"];
        _groupConfig = (configFile >> _root >> _side >> _faction >> _type >> _group);
        _side = getNumber (_groupConfig >> "side");
        
        [([] call EFUNC(common,getSpawnMachine)), _classname, _type, _side, {
            private ["_units","_worldPos"];
            _units = _this;
            _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
            // _units setPosASL _worldPos;
        }, [_groupPath]] call EFUNC(common,createObjectOnID);
    };
};

if (!_ctrlKeyHeld) then {
    GVAR(abSelectedObject) = [];
};