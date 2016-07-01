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
 * [unit, {}, []] call mars_common_fnc_execWhereLocal;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_target", objNull, [objNull, grpNull]],
    ["_code", {}, [{}, ""]],
    ["_args", [], [[]]]
];

if (isNull _target) exitWith {};

if (_code isEqualType "") then {
    _code = compile _code;
};

if (local _target) exitWith {
    _args call _code;
};

_target = if (_target isEqualType grpNull) then {groupOwner _target} else {_target};
private _result = [_code, _args] remoteExecCall [QFUNC(_execLocalCode), _target, false];

_result
