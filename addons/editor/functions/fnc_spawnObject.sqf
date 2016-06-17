/*
 * Author: Kingsley
 * Spawns the given object on the machine this function was executed on
 * Used by the asset browser - should NOT be used for general object spawning
 *
 * Arguments:
 * 0: Position <ARRAY>
 * 1: Asset browser data <ARRAY>
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

params [
    ["_position", [], [[]]],
    ["_caller", objNull, [objNull]],
    ["_objectData", [], [[]]]
];

_objectData params ["_type", "_classname", "_iconPath", "_color", "_side", ["_groupConfigStr", ""]];

_position = ASLtoAGL _position;
_side = [_side] call CFUNC(getSideByInt);

switch (_type) do {
    case "unit": {
        private _config = (configFile >> "CfgVehicles" >> _classname);
        private _isMan = [false, ([false, true] select (getNumber (_config >> "isMan")))] select (!isNull (_config >> "isMan"));
        
        if (_isMan) then {
            private _group = createGroup _side;
            private _unit = _group createUnit [_classname, _position, [], 0, "CAN_COLLIDE"];
            [_unit] joinSilent _group;
            [_unit] remoteExecCall [QFUNC(addObjectToSelection), _caller];
        } else {
            private _group = createGroup _side;
            private _vehicle = createVehicle [_classname, _position, [], 0, "CAN_COLLIDE"];
            createVehicleCrew _vehicle;
            {[_x] joinSilent _group;false} count (crew _vehicle);
            [_vehicle] remoteExecCall [QFUNC(addObjectToStaticCache), _caller];
            [_vehicle] remoteExecCall [QFUNC(addObjectToSelection), _caller];
        };
    };
    case "object": {
        private _object = createVehicle [_classname, _position, [], 0, "CAN_COLLIDE"];
        [_object] remoteExecCall [QFUNC(addObjectToStaticCache), _caller];
        [_object] remoteExecCall [QFUNC(addObjectToSelection), _caller];
    };
    case "group": {
        private _group = createGroup _side;
        private _groupConfig = call compile _groupConfigStr;
        private _units = "true" configClasses (_groupConfig);
        
        private _groupUnits = [];
        private _highestRankInt = -1;
        private _highestRankObj = objNull;
        
        {
            private _unitConfig = _x;
            private _unitClassname = getText (_unitConfig >> "vehicle");
            private _unitVehicleConfig = (configFile >> "CfgVehicles" >> _unitClassname);
            private _unitIsMan = [false, ([false, true] select (getNumber (_unitVehicleConfig >> "isMan")))] select (!isNull (_unitVehicleConfig >> "isMan"));
            private _unitRank = getText (_unitConfig >> "rank");
            private _unitOffset = getArray (_unitConfig >> "position");
            private _unitDir = [0, getNumber (_unitConfig >> "dir")] select (!isNull (_unitConfig >> "dir"));
            private _unitPos = _position vectorAdd _unitOffset;
            private _unitRankNumber = [_unitRank] call CFUNC(getRankNumber);
            
            // Set altitude to 0 to prevent accidental placement over objects resulting in units falling
            _unitPos set [2, 0];
            
            if (_unitIsMan) then {
                private _unit = _group createUnit [_unitClassname, _unitPos, [], 0, "CAN_COLLIDE"];
                _unit setUnitRank _unitRank;
                _unit setFormDir _unitDir;
                _unit setDir _unitDir;
                
                if (_unitRankNumber > _highestRankInt) then {
                    _highestRankInt = _unitRankNumber;
                    _highestRankObj = _unit;
                };
                
                _groupUnits pushBack _unit;
            } else {
                private _vehicle = createVehicle [_unitClassname, _unitPos, [], 0, "CAN_COLLIDE"];
                createVehicleCrew _vehicle;
                _vehicle setFormDir _unitDir;
                _vehicle setDir _unitDir;
                
                {_groupUnits pushBack _x;false} count (crew _vehicle);
                _groupUnits pushBack _vehicle;
            };
            
            false
        } count _units;
        
        _groupUnits joinSilent _group;
        _group selectLeader _highestRankObj;
        
        [_groupUnits] remoteExecCall [QFUNC(addObjectToStaticCache), _caller];
        [_groupUnits] remoteExecCall [QFUNC(addObjectToSelection), _caller];
    };
};
