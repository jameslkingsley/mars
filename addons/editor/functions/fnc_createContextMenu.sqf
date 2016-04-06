/*
 * Author: Kingsley
 * Creates the context menu with all relevant event handlers
 *
 * Arguments:
 * None (uses GVAR(selection))
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_createContextMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_contexts", []], ["_pIndex", 0]];

if (count _contexts > 0) then {
    {
        private ["_config","_condition","_index"];
        _config = _x;
        _index = _forEachIndex;
        _condition = getText (_config >> "condition");
        if (_condition == "") then {_condition = "true"};
        
        // Run the condition for all in selection
        if (({_x call compile _condition} count GVAR(selection)) > 0) then {
            _idc = 96300 + _index + _pIndex;
            _children = "true" configClasses (_config);
            _hasChildren = (count _children > 0);
            _displayName = getText (_config >> "displayName");
            _action = getText (_config >> "action");
            _requiresPosition = [false,true] select (getNumber (_config >> "requiresPosition"));
        };
    } forEach _contexts;
} else {
    _contexts = [];
    
    {
        {
            _contexts pushBack _x;
        } forEach ("true" configClasses (_x));
    } forEach ("true" configClasses (configFile >> QGVARMAIN(context)));
    
    [_contexts, _pIndex] call FUNC(createContextMenu);
};
