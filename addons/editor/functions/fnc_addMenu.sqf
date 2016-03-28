/*
 * Author: Kingsley
 * Adds a menu to the top navigation bar
 *
 * Arguments:
 * 0: Unique index <STRING>
 * 1: Display name <STRING>
 *
 * Return Value:
 * Menu index, empty string if not successful <STRING>
 *
 * Example:
 * _myMenu = ["MyMenuIndex", "My Menu"] call mars_editor_fnc_addMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_index", "_displayName"];

private _indexExists = false;

{
    if (toLower (_x select 0) == toLower _index) exitWith {
        MARS_LOGERROR_1("Menu is already in use", _index);
        _indexExists = true;
    };
    
    false
} count GVAR(menus);

if (_indexExists) exitWith {""};

GVAR(menus) pushBack [
    _index,
    _displayName,
    []
];

[] call FUNC(redrawMenus);

_index