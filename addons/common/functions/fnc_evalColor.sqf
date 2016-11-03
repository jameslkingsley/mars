/*
 * Author: Kingsley
 * Evaluates the given color array to resolve strings
 *
 * Arguments:
 * 0: Color array <ARRAY>
 *
 * Return Value:
 * Color array <ARRAY>
 *
 * Example:
 * [[0,0,"profileNamespace getVariable ['someVar', 0.5]",1]] call mars_common_fnc_evalColor;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_color", [], [[]]]];

private _result = [];

{
    if (_x isEqualType 0) then {
        _result pushBack _x;
    };

    if (_x isEqualType "") then {
        _result pushBack (call compile _x);
    };
} forEach _color;

_result
