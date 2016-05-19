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
    ["_targetID", -1, [0]],
    ["_classname", "", [""]],
    ["_initCode", {}, [{},""]],
    ["_isOnTarget", false, [false]]
];

if (_netID == -1 || _classname == "") exitWith {false};

if (typeName _initCode == "STRING") then {
    _initCode = compile _initCode;
};

if (_isOnTarget) exitWith {
    _object = createVehicle [_classname, [0,0,5], [], 0, "NONE"];
    _object call _initCode;
};

[_targetID, _classname, _initCode, true] remoteExec [QFUNC(createObjectOnID), _targetID];