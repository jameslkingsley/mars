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

_createCtrl = {
    params ["_idc","_hasChildren"];
    
    _control = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_contextBase", _idc];
    _control ctrlSetText (format ["%1%2", _text, (["","..."] select _hasChildren)]);

    _axisX = if (count _parentCtrlPos > 0) then {((_parentCtrlPos select 0) + (CONTEXT_OPTION_WIDTH + 0.005))} else {(GVAR(mousePos) select 0)};
    _axisY = if (count _parentCtrlPos > 0) then {((_parentCtrlPos select 1) + (CONTEXT_OPTION_HEIGHT * _index))} else {(GVAR(mousePos) select 1)};

    _controlPos = [
        _axisX,
        _axisY /*+ (CONTEXT_OPTION_HEIGHT * _index)*/,
        CONTEXT_OPTION_WIDTH,
        CONTEXT_OPTION_HEIGHT
    ];

    _control ctrlSetPosition _controlPos;
};

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
        private ["_config","_level","_index","_children","_hasChildren","_idc"];
        _config = _x;
        _level = 1;
        _index = _forEachIndex;
        _idc = _index * 1000;
        _children = "true" configClasses (_config);
        _hasChildren = (count _children > 0);
        
        // Create parent
        [_idc, _hasChildren] call _createCtrl;
        
        if (_hasChildren) then {
            {
                // Child level
                private ["_config","_level","_index"];
                _config = _x;
                _level = 2;
                _index = _forEachIndex;
                
                // Create child
            } forEach _children;
        };
    } forEach _parents;
    
    if ((count _components - 1) > _index) then {
        // Create spacer
    };
} forEach _components;