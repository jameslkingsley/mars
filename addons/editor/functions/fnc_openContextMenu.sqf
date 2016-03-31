/*
 * Author: Kingsley
 * Opens the context menu and builds the list from the config
 *
 * Arguments:
 * 0: Selection <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unitOne, unitTwo, unitThree]] call mars_editor_fnc_openContextMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

_components = "true" configClasses (configFile >> QGVARMAIN(Context));

[] call FUNC(closeContextMenu);

{
    _options = "true" configClasses (_x);
    diag_log (str _options);
    
    {
        _config = _x;
        _displayName = getText (_x >> "displayName");
        _condition = getText (_x >> "condition");
        //if !({_x call compile _condition} count GVAR(selection) > 0) exitWith {};
        _children = "true" configClasses (_x);
        _hasChildren = [false,true] select ((count _children) > 0);
        [_config, _forEachIndex, _displayName, _hasChildren] call FUNC(createContextControl);
    } forEach _options;
} forEach _components;