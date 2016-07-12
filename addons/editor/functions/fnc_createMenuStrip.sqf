/*
 * Author: Kingsley
 * Builds the top navigation bar menus
 *
 * Arguments:
 * 0: Editor's main display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call mars_editor_fnc_createMenuStrip;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_display", displayNull]];

private _ctrlMenu = _display displayCtrl IDC_MENUSTRIP;
private _menus = [];

{_menus append ("true" configClasses (_x));false} count ("true" configClasses (configFile >> QGVARMAIN(menu)));

private _add = {
    params ["_ctrlMenu", "_menus", "_path"];

    {
        private _displayName = getText (_x >> "displayName");
        private _action = getText (_x >> "action");
        private _children = "true" configClasses (_x);

        if (!isNil _action) then {
            _action = format ["_this call %1", _action];
        };

        private _iPath = _ctrlMenu menuAdd [_path, _displayName];

        _ctrlMenu menuSetAction [(_path + [_iPath]), _action];
        _ctrlMenu menuSort [_path, false];

        if !(_children isEqualTo []) then {
            [_ctrlMenu, _children, (_path + [_iPath])] call _add;
        };

        false
    } count _menus;
};

{
    private _displayName = getText (_x >> "displayName");
    private _action = getText (_x >> "action");
    private _children = "true" configClasses (_x);

    if (!isNil _action) then {
        _action = format ["_this call %1", _action];
    };

    private _iPath = _ctrlMenu menuAdd [[], _displayName];

    [_ctrlMenu, _children, [_iPath]] call _add;

    false
} count _menus;
