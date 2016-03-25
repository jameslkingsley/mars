/*
 * Author: Kingsley
 * Removes a menu from the top navigation bar
 *
 * Arguments:
 * 0: Unique index <STRING>
 *
 * Return Value:
 * true if removed, false if not found <BOOL>
 *
 * Example:
 * _removed = ["MyMenuIndex"] call mars_editor_fnc_removeMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_index"];

private _indexExists = false;

{
    if (toLower (_x select 0) == toLower _index) exitWith {
        _indexExists = true;
        GVAR(menus) = GVAR(menus) - _x;
    };
} forEach GVAR(menus);

if (!_indexExists) exitWith {false};

[] call FUNC(redrawMenus);

true