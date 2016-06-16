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

if (GVAR(abSelectedObject) isEqualTo []) exitWith {};

GVAR(abSelectedObject) params ["_type", "_classname", "_iconPath", "_color", "_side", ["_groupConfigStr", ""]];

private _worldPos = [] call FUNC(getSurfaceUnderCursor);

switch (_type) do {
    case "man": {
        _classname = configName (configFile >> "CfgVehicles" >> _classname);
        _sideInt = getNumber (configFile >> "CfgVehicles" >> _classname >> "side");
        _side = [_sideInt] call EFUNC(common,getSideByInt);
        
        [([] call EFUNC(common,getSpawnMachine)), _classname, _type, _side, _worldPos, {
            private ["_object","_worldPos"];
            _object = _this;
        }] call EFUNC(common,createObjectOnID);
    };
    case "vehicle": {
        _classname = configName (configFile >> "CfgVehicles" >> _classname);
        _sideInt = getNumber (configFile >> "CfgVehicles" >> _classname >> "side");
        _side = [_sideInt] call EFUNC(common,getSideByInt);
        
        [([] call EFUNC(common,getSpawnMachine)), _classname, _type, _side, _worldPos, {
            private ["_object","_worldPos"];
            _object = _this;
        }] call EFUNC(common,createObjectOnID);
    };
    case "group": {
        _groupPath params ["_root", "_side", "_faction", "_type", "_group"];
        _groupConfig = (configFile >> _root >> _side >> _faction >> _type >> _group);
        _sideInt = getNumber (_groupConfig >> "side");
        _side = [_sideInt] call EFUNC(common,getSideByInt);
        
        [([] call EFUNC(common,getSpawnMachine)), _classname, _type, _side, _worldPos, {
            private ["_units","_worldPos"];
            _units = _this;
        }, [_groupPath]] call EFUNC(common,createObjectOnID);
    };
};

if (!_ctrlKeyHeld) then {
    GVAR(abSelectedObject) = [];
};

deleteVehicle GVAR(prepSurfaceSphere);
GVAR(prepSurfaceSphere) = objNull;
GVAR(allowDragging) = false;
GVAR(allowDirection) = false;
GVAR(selection) = [];