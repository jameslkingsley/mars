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

disableSerialization;

_components = "true" configClasses (configFile >> QGVARMAIN(Context));

{
    // Component level
    private ["_config","_level","_parents","_forEachIndex"];
    _config = _x;
    _level = -1;
    _compIndex = _forEachIndex;
    _parents = "true" configClasses (_config);
    
    {
        // Parent level
        private ["_config","_level","_index","_children","_hasChildren","_idc","_displayName","_condition","_forEachIndex"];
        _config = _x;
        _condition = getText (_config >> "condition");
        if (_condition == "") then {_condition = "true"};
        
        // Run the condition for all in selection
        if (({_x call compile _condition} count GVAR(selection)) > 0) then {
            _level = 0;
            _index = _forEachIndex;
            _idc = 1000 + _index;
            _children = "true" configClasses (_config);
            _hasChildren = (count _children > 0);
            _displayName = getText (_config >> "displayName");
            _action = getText (_config >> "action");
            _requiresPosition = [false,true] select (getNumber (_config >> "requiresPosition"));
            
            // Create parent
            _parent = [_idc, 0, _level, _hasChildren, _displayName, _compIndex, _index] call FUNC(createContextControl);
            _parentCtrl = (GETUVAR(GVAR(interface),displayNull) displayCtrl _parent);
            _parentCtrlPos = ctrlPosition _parentCtrl;
            GVAR(parentContextControls) pushBack _parent;
            
            missionNamespace setVariable [(format ["%1_%2", QGVAR(__context_idc), _parent]), [_hasChildren, _parentCtrlPos, _children, _index, _action, _requiresPosition, _compIndex]];
            
            _parentCtrl ctrlAddEventHandler ["MouseEnter", {
                disableSerialization;
                
                params ["_control"];
                private ["_idc","_parentData","_hasChildren","_parentCtrlPos","_children"];
                
                _idc = ctrlIDC _control;
                
                diag_log format["_idc: %1", _idc];
                
                [] call FUNC(closeChildContext);
                
                _parentData = missionNamespace getVariable [(format ["%1_%2", QGVAR(__context_idc), _idc]), []];
                
                if (count _parentData > 0) then {
                    _hasChildren = _parentData select 0;
                    _parentCtrlPos = _parentData select 1;
                    _children = _parentData select 2;
                    _offsetY = _parentData select 3;
                    _compIndex = _parentData select 6;
                    
                    if (_hasChildren) then {
                        {
                            // Child level
                            private ["_config","_level","_index","_idc","_displayName","_condition","_forEachIndex"];
                            _config = _x;
                            _condition = getText (_config >> "condition");
                            if (_condition == "") then {_condition = "true"};
                            
                            if (({_x call compile _condition} count GVAR(selection)) > 0) then {
                                _level = 1;
                                _index = _forEachIndex;
                                _idc = 10000 + _index;
                                _displayName = getText (_config >> "displayName");
                                _action = getText (_config >> "action");
                                _requiresPosition = [false,true] select (getNumber (_config >> "requiresPosition"));
                                
                                // Create child
                                _child = [_idc, _index, _level, false, _displayName, _offsetY, _compIndex] call FUNC(createContextControl);
                                _childCtrl = (GETUVAR(GVAR(interface),displayNull) displayCtrl _child);
                                GVAR(childContextControls) pushBack _child;
                                
                                missionNamespace setVariable [(format ["%1_%2", QGVAR(__context_idc), _child]), [_action, _requiresPosition]];
                                
                                _childCtrl ctrlAddEventHandler ["MouseEnter", {
                                    GVAR(isMouseOverChild) = true;
                                }];
                                
                                _childCtrl ctrlAddEventHandler ["MouseExit", {
                                    if !(GVAR(isMouseOverChild)) then {
                                        [] call FUNC(closeChildContext);
                                    };
                                }];
                                
                                _childCtrl ctrlAddEventHandler ["MouseButtonUp", {
                                    disableSerialization;
                                    
                                    params ["_control"];
                                    private ["_idc","_childData","_action","_requiresPosition"];
                                    
                                    _idc = ctrlIDC _control;
                                    
                                    [] call FUNC(closeContextMenu);
                                    
                                    _childData = missionNamespace getVariable [(format ["%1_%2", QGVAR(__context_idc), _idc]), []];
                                    
                                    if (count _childData > 0) then {
                                        _action = _childData select 0;
                                        _requiresPosition = _childData select 1;
                                        [_action, _requiresPosition] call FUNC(execContextAction);
                                    };
                                }];
                            };
                        } forEach _children;
                    };
                };
            }];
            
            if (!_hasChildren) then {
                _parentCtrl ctrlAddEventHandler ["MouseButtonUp", {
                    disableSerialization;
                    
                    params ["_control"];
                    private ["_idc","_parentData","_action","_requiresPosition"];
                    
                    _idc = ctrlIDC _control;
                    
                    [] call FUNC(closeContextMenu);
                    
                    _parentData = missionNamespace getVariable [(format ["%1_%2", QGVAR(__context_idc), _idc]), []];
                    
                    if (count _parentData > 0) then {
                        _action = _parentData select 4;
                        _requiresPosition = _parentData select 5;
                        [_action, _requiresPosition] call FUNC(execContextAction);
                    };
                }];
            };
        };
    } forEach _parents;
    
    if (((count _components) - 1) > _index) then {
        // Create spacer
    };
} forEach _components;
