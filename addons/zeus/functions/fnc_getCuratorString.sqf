/*
 * Author: Kingsley
 * Returns the login string
 *
 * Arguments:
 * None
 *
 * Return Value:
 * String <STRING>
 *
 * Example:
 * [] call mars_zeus_fnc_getCuratorString;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _output = "Curator: Unavailable";

if (!isNil QGVAR(zeusModule)) then {
    private _curator = getAssignedCuratorUnit GVAR(zeusModule);
    
    if (isNull _curator) then {
        _output = "Curator: Available";
    } else {
        _output = format ["Curator: %1", name _curator];
    };
} else {
    _output = "Curator: Unavailable";
};

_output