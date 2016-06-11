/*
 * Author: Kingsley
 * Returns true or false whether Zeus is available
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Available <BOOL>
 *
 * Example:
 * [] call mars_zeus_fnc_isAvailable;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _available = false;

if (!isNil QGVAR(zeusModule)) then {
    _curator = getAssignedCuratorUnit GVAR(zeusModule);
    
    if (isNull _curator) then {
        _available = true;
    } else {
        if (_curator == player) then {
            _available = true;
        } else {
            _available = false;
        };
    };
} else {
    _available = false;
};

_available