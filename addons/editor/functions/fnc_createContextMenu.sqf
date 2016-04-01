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

_components = "true" configClasses (configFile >> QGVARMAIN(Context));

{
    // Component level
    private ["_config","_level","_index","_parents"];
    _config = _x;
    _level = 0;
    _index = _forEachIndex;
    _parents = "true" configClasses (_config);
    
    {
        // Parent level
        private ["_config","_level","_index","_children","_hasChildren"];
        _config = _x;
        _level = 1;
        _index = _forEachIndex;
        _children = "true" configClasses (_config);
        _hasChildren = false;
        
        if (count _children > 0) then {
            _hasChildren = true;
            
            {
                // Child level
                private ["_config","_level","_index"];
                _config = _x;
                _level = 2;
                _index = _forEachIndex;
            } forEach _children;
        };
    } forEach _parents;
} forEach _components;