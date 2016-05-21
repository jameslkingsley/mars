/*
 * Author: Kingsley
 * Creates the given object on the given target machine ID
 *
 * Arguments:
 * See below
 *
 * Return Value:
 * Created object <OBJECT>
 *
 * Example:
 * [([] call mars_common_fnc_getSpawnMachine), "B_soldier_F", {_this allowDamage false}] call mars_common_fnc_createObjectOnID;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_targetID", -1],
    ["_classname", "", [""]],
    ["_type", "unit", [""]],
    ["_side", sideUnknown, [sideUnknown]],
    ["_worldPos", [], [[]]],
    ["_initCode", {}, [{},""]],
    ["_extraArgs", [], [[]]],
    ["_isOnTarget", false, [false]],
    ["_caller", objNull, [objNull]]
];

if (_targetID == -1 || _classname == "" || _type == "") exitWith {false};

if (typeName _initCode == "STRING") then {
    _initCode = compile _initCode;
};

if (_isOnTarget) exitWith {
    switch (_type) do {
        case "man": {
            _group = createGroup _side;
            _object = _group createUnit [_classname, ASLtoAGL _worldPos, [], 0, "NONE"];
            [_object] join _group;
            _object call _initCode;
            [_object] remoteExec [QEFUNC(editor,addObjectToSelection), _caller];
        };
        case "vehicle": {
            _group = createGroup _side;
            _object = createVehicle [_classname, ASLtoAGL _worldPos, [], 0, "NONE"];
            createVehicleCrew _object;
            {[_x] join _group} forEach (crew _object);
            _object call _initCode;
            [_object] remoteExec [QEFUNC(editor,addObjectToSelection), _caller];
        };
        case "group": {
            _newGroup = createGroup _side;
            _extraArgs params ["_groupPath"];
            _groupPath params ["_root", "_side", "_faction", "_type", "_group"];
            _groupConfig = (configFile >> _root >> _side >> _faction >> _type >> _group);
            _groupUnits = "true" configClasses (_groupConfig);
            _retUnits = [];
            _highestRankInt = 0;
            _highestRankObj = objNull;
            
            {
                private _unitConfig = _x;
                private _unitClassname = getText (_unitConfig >> "vehicle");
                private _unitIsMan = [false,true] select (([format["configFile >> 'CfgVehicles' >> '%1'", _unitClassname]] call FUNC(getObjectType)) == "man");
                private _unitRank = getText (_unitConfig >> "rank");
                private _unitOffset = getArray (_unitConfig >> "position");
                private _unitPos = ASLtoAGL (_worldPos vectorAdd _unitOffset);
                private _unitRankNumber = [_unitRank] call FUNC(getRankNumber);
                
                _unitPos set [2, 0];
                
                if (_unitIsMan) then {
                    _unitObj = _newGroup createUnit [_unitClassname, _unitPos, [], 0, "NONE"];
                    _unitObj setUnitRank _unitRank;
                    [_unitObj] join _newGroup;
                    
                    if (_unitRankNumber > _highestRankInt) then {
                        _highestRankInt = _unitRankNumber;
                        _highestRankObj = _unitObj;
                    };
                    
                    _retUnits pushBack _unitObj;
                } else {
                    _object = createVehicle [_unitClassname, _unitPos, [], 0, "NONE"];
                    createVehicleCrew _object;
                    {[_x] join _newGroup} forEach (crew _object);
                    _retUnits pushBack _object;
                    [_object] remoteExec [QEFUNC(editor,addObjectToSelection), _caller];
                };
            } forEach _groupUnits;
            
            _retUnits join _newGroup;
            _newGroup selectLeader _highestRankObj;
            
            _retUnits call _initCode;
        };
    };
};

[_targetID, _classname, _type, _side, _worldPos, _initCode, _extraArgs, true, player] remoteExec [QFUNC(createObjectOnID), _targetID];