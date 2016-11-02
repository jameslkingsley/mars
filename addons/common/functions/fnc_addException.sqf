/*
 * Author: Kingsley
 * Adds an exception to the list
 *
 * Arguments:
 * 0: Name <STRING>
 * 1: Code <CODE, STRING>
 *
 * Return Value:
 * Added successfully <BOOL>
 *
 * Example:
 * ["isPlayer", {isPlayer _this}] call mars_common_fnc_addException;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_name", "", [""]], ["_code", {}, ["", {}]]];

private _existing = GVAR(exceptions) select {(_x select 0) == _name};

if !(_existing isEqualTo []) exitWith {
    MARS_LOGERROR_1("Exception %1 is already used", _name);
    false
};

if (_code isEqualType "") then {
    _code = compile _code;
};

GVAR(exceptions) pushBackUnique [_name, _code];

true
