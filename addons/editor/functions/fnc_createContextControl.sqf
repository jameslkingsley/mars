/*
 * Author: Kingsley
 * Creates the context control item and sets up the relevant event handlers
 *
 * Arguments:
 * 0: Config <STRING>
 * 1: Index <INT>
 * 2: Text <STRING>
 * 3: Has children <BOOL>
 *
 * Return Value:
 * Control <CONTROL>
 *
 * Example:
 * [897, "My Context Item", true] call mars_editor_fnc_createContextControl;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_config", ""],
    ["_index", -1],
    ["_text", ""],
    ["_hasChildren", false],
    ["_isChild", false],
    ["_parentCtrlPos", []]
];

if (_index < 0 || _text == "") exitWith {};

private ["_idc","_control"];

_idc = [(_index + 10000), (_index + 100000)] select _isChild;

_control = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_contextBase", _idc];
_control ctrlSetText (format ["%1%2", _text, (["","..."] select _hasChildren)]);

_axisX = if (count _parentCtrlPos > 0) then {((_parentCtrlPos select 0) + (CONTEXT_OPTION_WIDTH + 0.005))} else {(GVAR(mousePos) select 0)};
_axisY = if (count _parentCtrlPos > 0) then {((_parentCtrlPos select 1) + (CONTEXT_OPTION_HEIGHT * _index))} else {(GVAR(mousePos) select 1)};

_controlPos = [
    _axisX,
    _axisY + (CONTEXT_OPTION_HEIGHT * _index),
    CONTEXT_OPTION_WIDTH,
    CONTEXT_OPTION_HEIGHT
];

_control ctrlSetPosition _controlPos;

/*
if (_hasChildren && !_isChild && !(_idc in GVAR(parentContextControls))) then {
    GVAR(childContextControls) pushBack _idc;
    GVAR(isChildContextOpen) = true;
};*/

if (_isChild) then {
    GVAR(childContextControls) pushBack _idc;
    GVAR(isChildContextOpen) = true;
} else {
    GVAR(parentContextControls) pushBack _idc;
};

missionNamespace setVariable [(format ["%1_%2", QGVAR(__context_idc), _idc]), [_config, _controlPos, _isChild]];

if (_isChild) then {
    _control ctrlAddEventHandler ["MouseExit", {
        if !(GVAR(isMouseOverChild)) then {
            [] call FUNC(closeChildContext);
        };
    }];
} else {
    /*_control ctrlAddEventHandler ["MouseExit", {
        [] call FUNC(closeChildContext);
    }];*/
};

if (_hasChildren) then {
    _control ctrlAddEventHandler ["MouseEnter", {
        disableSerialization;
        params ["_control"];
        
        private ["_idc","_parentConfig"];
        
        //if !(GVAR(isMouseOverChild)) then {
            [] call FUNC(closeChildContext);
        //};
        
        _idc = ctrlIDC _control;
        _idcData = missionNamespace getVariable [(format ["%1_%2", QGVAR(__context_idc), _idc]), [configNull,[],false]];
        _parentConfig = _idcData select 0;
        if (_idcData select 2) then {GVAR(isMouseOverChild) = true;};
        
        if ((str _parentConfig) != "") then {
            _options = "true" configClasses (_parentConfig);
            if (count _options > 0) then {
                {
                    _childConfig = _x;
                    _displayName = getText (_x >> "displayName");
                    _condition = getText (_x >> "condition");
                    //if !({_x call compile _condition} count GVAR(selection) > 0) exitWith {};
                    _children = "true" configClasses (_x);
                    _hasChildren = [false,true] select ((count _children) > 0);
                    diag_log (str [_childConfig, _forEachIndex, _displayName, _hasChildren, !_hasChildren, (ctrlPosition _control)]);
                    [_childConfig, _forEachIndex, _displayName, _hasChildren, !_hasChildren, (ctrlPosition _control)] call FUNC(createContextControl);
                    GVAR(isChildContextOpen) = true;
                } forEach _options;
            };
        };
    }];
} else {
    if (!_isChild || (_hasChildren && !_isChild)) then {
        _control ctrlAddEventHandler ["MouseEnter", {
            [] call FUNC(closeChildContext);
            GVAR(isMouseOverChild) = false;
            GVAR(isChildContextOpen) = false;
        }];
    };
    
    _control ctrlAddEventHandler ["MouseButtonUp", {
        disableSerialization;
        params ["_control"];
        
        private ["_idc","_parentConfig"];
        
        _idc = ctrlIDC _control;
        _parentConfig = (missionNamespace getVariable [(format ["%1_%2", QGVAR(__context_idc), _idc]), [configNull,[],false]]) select 0;
        
        if ((str _parentConfig) != "") then {
            _requiresPosition = [false,true] select (getNumber (_parentConfig >> "requiresPosition"));
            _condition = getText (_parentConfig >> "condition");
            _action = getText (_parentConfig >> "action");
            
            if (({_x call compile _condition} count GVAR(selection)) > 0) then {
                if (_requiresPosition) then {
                    GVAR(isWaitingForLeftClick) = true;
                    [{GVAR(hasLeftClicked)}, {
                        _worldPos = screenToWorld GVAR(mousePos);
                        [GVAR(selection), _worldPos] call compile (_this select 0);
                        GVAR(hasLeftClicked) = false;
                        GVAR(isWaitingForLeftClick) = false;
                    }, [_action]] call EFUNC(common,waitUntilAndExecute);
                } else {
                    GVAR(selection) call compile _action;
                };
            };
        };
        
        [] call FUNC(closeContextMenu);
    }];
};

_control ctrlCommit 0;

diag_log str GVAR(parentContextControls);
diag_log str GVAR(childContextControls);
