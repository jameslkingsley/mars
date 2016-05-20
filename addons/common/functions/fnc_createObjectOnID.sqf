/*
 * Author: Kingsley
 * Creates the given object on the given target machine ID
 *
 * Arguments:
 * 0: Target ID <INT>
 * 1: Object classname <STRING>
 * 2: Code to run on object init <CODE>
 * 3: Is on target (if true, will create the object on the local machine) <BOOL>
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
            _object = _group createUnit [_classname, [0,0,5], [], 0, "NONE"];
            [_object] join _group;
            _object call _initCode;
        };
        case "vehicle": {
            _object = createVehicle [_classname, [0,0,5], [], 0, "NONE"];
            _object call _initCode;
        };
        case "group": {
            _group = createGroup _side;
            _groupPath params ["_root", "_side", "_faction", "_type", "_group"];
            _groupConfig = (configFile >> _root >> _side >> _faction >> _type >> _group);
            _icon = getText (_groupConfig >> "icon");
            _side = getNumber (_groupConfig >> "side");
            _color = [_side] call EFUNC(common,getSideColorByInt);
            _object = _group createUnit [_classname, [0,0,5], [], 0, "NONE"];
            [_object] join _group;
            _object call _initCode;
        };
    };
    
    if (!isNull _caller && !isNil "_object" && {!isNull _object}) then {
        [_object] remoteExec [QEFUNC(editor,addObjectToSelection), _caller];
    };
};

[_targetID, _classname, _type, _side, _initCode, [], true, player] remoteExec [QFUNC(createObjectOnID), _targetID];