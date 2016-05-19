/*
 * Author: Kingsley
 * Creates the given object on the given target machine ID
 *
 * Arguments:
 * 0: Target ID <INT>
 * 1: Object classname <STRING>
 *
 * Return Value:
 * True if created, false if not <BOOL>
 *
 * Example:
 * [] call mars_common_fnc_createObjectOnID;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_targetID", -1, [0]],
    ["_classname", "", [""]],
    ["_isOnTarget", false, [false]]
];

if (_netID == -1 || _classname == "") exitWith {false};

if (_isOnTarget) exitWith {
    
};

[_targetID, _classname, true] remoteExec [QFUNC(createObjectOnID), _targetID];