/*
 * Author: Kingsley
 * Executes given code where given unit/group is local
 *
 * Arguments:
 * 0: Unit or group <OBJECT/GROUP>
 * 1: Code to execute <CODE>
 * 2: Arguments to pass to code <ARRAY>
 *
 * Return Value:
 * Empty string if successful (see https://community.bistudio.com/wiki/remoteExec)
 *
 * Example:
 * [] call mars_common_fnc_execWhereLocal;
 *
 * Public:
 */

#include "script_component.hpp"

params [
    ["_target", objNull],
    ["_code", {}],
    ["_args", []]
];

if (isNull _target) exitWith {};

if (local _target) exitWith {
    [_code, _args] call FUNC(_execLocalCode);
};

private _targets = [_target, (groupOwner _target)] select (typeName _target == "GROUP");
private _result = [_code, _args] remoteExec [QFUNC(_execLocalCode), _targets, false];

_result