/*
 * Author: Kingsley
 * Returns the login button string
 *
 * Arguments:
 * None
 *
 * Return Value:
 * String <STRING>
 *
 * Example:
 * [] call mars_zeus_fnc_getCuratorBtnString;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _output = "Disabled";

if (!isNil QGVAR(zeusModule)) then {
    _curator = getAssignedCuratorUnit GVAR(zeusModule);
    
    if (isNull _curator) then {
        _output = "Login";
    } else {
        if (_curator == player) then {
            _output = "Logout";
        } else {
            _output = "Login";
        };
    };
} else {
    _output = "Login";
};

_output