/*
 * Author: Kingsley
 * Creates the attributes GUI
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Component <STRING>
 * 2: Attribute class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [displayNull, "mars_environment", "environment"] call mars_attributes_fnc_onAttributesLoad;
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\z\mars\addons\common\macros.hpp"

params [
    ["_display", displayNull, [displayNull]],
    ["_component", "", [""]],
    ["_attribute", "", [""]]
];

SETUVAR(GVAR(interface),_display);
GVAR(isOpen) = true;

#define CONTROL(IDC) (_display displayCtrl IDC)
#define LABEL_RATIO GVAR(AttributesWindow_GlobalLabelRatio)
#define FIELD_RATIO GVAR(AttributesWindow_GlobalFieldRatio)
#define CATEGORY_Y_IOFFSET -(GRID_H * 2)
#define ITEM_SPACING GRID_H
#define CATEGORY_SPACING (SIZE_M * GRID_H)
#define CATEGORY_X CATEGORY_SPACING
#define CATEGORY_Y CATEGORY_SPACING
#define LABEL_WIDTH ((GVAR(AttributesWindow_GlobalWidth) * LABEL_RATIO) * GRID_W)
#define LABEL_HEIGHT (SIZE_M * GRID_H)
#define FIELD_WIDTH (((GVAR(AttributesWindow_GlobalWidth) * FIELD_RATIO) * GRID_W) - (CATEGORY_SPACING * 2) - GRID_W)

_header = (configFile >> QGVARMAIN(attributes) >> _component >> _attribute);
_requiredConfig = "configFile";

if (!isClass _header) then {
    _header = (missionConfigFile >> QGVARMAIN(attributes) >> _component >> _attribute);
    _requiredConfig = "missionConfigFile";

    if (!isClass _header) exitWith {
        MARS_LOGERROR_2("Attribute is not a class: %1 >> %2", _component, _attribute);
    };
};

GVAR(AttributesWindow_onConfirm) = ["AttributesWindow_onConfirm", {
    {
        _display = GETUVAR(GVAR(interface),displayNull);
        
        if (_x isEqualType []) then {
            _joinedExecData = _x apply {
                ((_display displayCtrl _x) getVariable [QGVAR(execReturnData), (_display displayCtrl _x)])
            };
            
            _commonExecs = [];
            _finalExecs = [];
            
            {
                _ctrl = _display displayCtrl _x;
                _execExpressionStr = _ctrl getVariable [QGVAR(execExpressionStr), ""];
                _commonExecs pushBackUnique _execExpressionStr;
            } forEach _x;
            
            {
                _ctrl = _display displayCtrl _x;
                _execExpression = _ctrl getVariable [QGVAR(execExpression), false];
                _execExpressionStr = _ctrl getVariable [QGVAR(execExpressionStr), ""];
                
                if (_execExpression) then {
                    if (!isNil _execExpressionStr) then {
                        // Expression is a function name
                        _finalExecs pushBackUnique format ["%1 call %2", _joinedExecData, _execExpressionStr];
                    } else {
                        _finalExecs pushBackUnique format ["%1 call compile '%2'", _joinedExecData, _execExpressionStr];
                    };
                };
            } forEach _x;
            
            {call compile _x} forEach _finalExecs;
        } else {
            _ctrl = _display displayCtrl _x;
            _execExpression = _ctrl getVariable [QGVAR(execExpression), false];
            _execExpressionStr = _ctrl getVariable [QGVAR(execExpressionStr), ""];
            _execReturnData = _ctrl getVariable [QGVAR(execReturnData), _ctrl];
            
            if (_execExpression) then {
                if (!isNil _execExpressionStr) then {
                    // Expression is a function name
                    call compile format ["%1 call %2", _execReturnData, _execExpressionStr];
                } else {
                    _execReturnData call compile _execExpressionStr;
                };
            };
        };
        
        false
    } count GVAR(AttributesWindow_ItemControls);
    GVAR(AttributesWindow_ItemControls) = [];
    GVAR(isOpen) = false;
}] call EFUNC(common,addEventHandler);

private _windowTitle = getText (_header >> "displayName");
private _evalWindowTitle = getNumber (_header >> "evalDisplayName");
if (_evalWindowTitle == 1) then {_windowTitle = GVAR(AttributesWindow_GlobalArgs) call compile _windowTitle};

CONTROL(IDC_EDITATTRIBUTES_TITLE) ctrlSetText _windowTitle;
_headerCtrlGroup = CONTROL(IDC_EDITATTRIBUTES_CATEGORIES);

_categories = "true" configClasses (_header);
_categoryIndex = 0;
_categoryIDC = IDC_EDITATTRIBUTES_CATEGORIES * 10;
_ctrlIDC = IDC_EDITATTRIBUTES_CATEGORIES * 1000;

_totalLabel = CATEGORY_Y_IOFFSET + ITEM_SPACING;

{
    // Categories
    _catConfig = _x;
    _items = "true" configClasses (_catConfig);
    _itemIDC = (_categoryIDC * 10) + _categoryIndex;
    _itemIndex = 0;
    
    {
        // Items
        _itemConfig = _x;
        _itemControls = "true" configClasses (_itemConfig);
        _itemLabelY = LABEL_HEIGHT + ITEM_SPACING;
        _itemLabel = _display ctrlCreate ["MARS_gui_ctrlButtonStaticAlignRight", _itemIDC, _headerCtrlGroup];
        
        private _labelDisplayName = if (isNull (_itemConfig >> "displayName")) then {""} else {getText (_itemConfig >> "displayName")};
        _itemLabel ctrlSetText _labelDisplayName;
        
        private _labelTooltipText = if (isNull (_itemConfig >> "tooltipText")) then {""} else {getText (_itemConfig >> "tooltipText")};
        _itemLabel ctrlSetTooltip _labelTooltipText;
        
        if (_labelDisplayName == "") then {
            _itemLabel ctrlShow false;
            _itemLabel ctrlEnable false;
        };
        
        _ctrlIndex = 0;
        _ctrlLargestHeight = 0;
        _ctrlIWidth = FIELD_WIDTH / count _itemControls;
        _ctrlXOffset = 0;
        _ctrlPrevIWidth = 0;
        
        {
            // Controls
            _ctrlConfig = _x;
            _ctrlXOffset = (_ctrlIndex min 1) * GRID_W;
            _ctrlPrevIWidth = _ctrlIWidth;
            
            if (!isNull (_ctrlConfig >> "width")) then {
                private _ctrlConfigWidth = getNumber (_ctrlConfig >> "width");
                _ctrlIWidth = ((_ctrlConfigWidth min 1) max 0.1) * FIELD_WIDTH;
            };
            
            _ctrlConfigPath = [
                _requiredConfig,
                format ["'%1'", QGVARMAIN(attributes)],
                format ["'%1'", _component],
                format ["'%1'", _attribute],
                format ["'%1'", configName _catConfig],
                format ["'%1'", configName _itemConfig],
                format ["'%1'", configName _ctrlConfig]
            ] joinString " >> ";
            
            _ctrlType = getText (_ctrlConfig >> "type");
            _ctrlCreateFunction = format ["%1_fnc_ctrl%2", QGVARMAIN(attributes), _ctrlType];

            if (!isNil _ctrlCreateFunction) then {
                _ctrlCreateCode = format [
                    "[""%1"", %7, %8, [%2,%3,%4,%5], %9] call %6",
                    _ctrlConfigPath,
                    CATEGORY_SPACING + LABEL_WIDTH + GRID_W + (_ctrlIndex * _ctrlPrevIWidth) + _ctrlXOffset, // X
                    _totalLabel + _itemLabelY, // Y
                    _ctrlIWidth - _ctrlXOffset, // W
                    LABEL_HEIGHT, // H
                    _ctrlCreateFunction,
                    _ctrlIDC,
                    IDC_EDITATTRIBUTES_CATEGORIES,
                    _itemIDC
                ];
                
                _ctrlRet = call compile _ctrlCreateCode;

                if (!isNull (_ctrlConfig >> "identifier")) then {
                    GVAR(identifyControls) pushBack [getText (_ctrlConfig >> "identifier"), _ctrlRet];
                } else {
                    GVAR(identifyControls) pushBack [format ["__Ctrl%1", _ctrlIDC], _ctrlRet];
                };
                
                private _condition = if (isNull (_ctrlConfig >> "condition")) then {"true"} else {
                    if (isNumber (_ctrlConfig >> "condition")) then {
                        ["false","true"] select (getNumber (_ctrlConfig >> "condition"))
                    } else {
                        getText (_ctrlConfig >> "condition")
                    };
                };
                
                if (_ctrlRet isEqualType []) then {
                    _idcArr = [];
                    
                    {
                        _ctrlIDC = ctrlIDC _x; // In case the control code changes the IDC for whatever reason
                        _idcArr pushBackUnique (ctrlIDC _x);
                        
                        _ctrlHeight = (ctrlPosition _x) select 3;
                        if (_ctrlHeight > _ctrlLargestHeight) then {
                            _ctrlLargestHeight = _ctrlHeight;
                            if (_ctrlHeight > LABEL_HEIGHT) then {
                                ADD(_totalLabel, (_ctrlHeight - CATEGORY_SPACING));
                            };
                        };
                    } forEach _ctrlRet;
                    
                    GVAR(AttributesWindow_ItemControls) pushBack _idcArr;
                    
                    if !(call compile _condition) then {
                        {_x ctrlEnable false} forEach (_ctrlRet + (_ctrlRet getVariable [QGVAR(siblings), []]));
                    };
                } else {
                    _ctrlIDC = ctrlIDC _ctrlRet; // In case the control code changes the IDC for whatever reason
                    GVAR(AttributesWindow_ItemControls) pushBackUnique (ctrlIDC _ctrlRet);
                    
                    _ctrlHeight = (ctrlPosition _ctrlRet) select 3;
                    if (_ctrlHeight > _ctrlLargestHeight) then {
                        _ctrlLargestHeight = _ctrlHeight;
                        if (_ctrlHeight > LABEL_HEIGHT) then {
                            ADD(_totalLabel, (_ctrlHeight - CATEGORY_SPACING));
                        };
                    };
                    
                    if !(call compile _condition) then {
                        _ctrlRet ctrlEnable false;
                        {_x ctrlEnable false} forEach (_ctrlRet getVariable [QGVAR(siblings), []]);
                    };
                };                
            };
            
            _ctrlPrevIWidth = _ctrlIWidth;
            
            INC(_ctrlIDC);
            INC(_ctrlIndex);
            
            false
        } count _itemControls;
        
        if ({
            private _condition = if (isNull (_x >> "condition")) then {"true"} else {
                if (isNumber (_x >> "condition")) then {
                    ["false","true"] select (getNumber (_x >> "condition"))
                } else {
                    getText (_x >> "condition")
                };
            };
            
            call compile _condition
        } count _itemControls == 0) then {
            _itemLabel ctrlEnable false;
        };

        if !(isNull (_itemConfig >> "init")) then {
            call compile getText (_itemConfig >> "init");
        };
        
        _itemLabelPosY = [(_totalLabel + _itemLabelY), ((_totalLabel + _itemLabelY) - _ctrlLargestHeight) + CATEGORY_SPACING] select (_ctrlLargestHeight > LABEL_HEIGHT);
        _itemLabel ctrlSetPosition [CATEGORY_SPACING, _itemLabelPosY, LABEL_WIDTH, LABEL_HEIGHT];
        _itemLabel ctrlCommit 0;
        
        ADD(_totalLabel, _itemLabelY);
        
        INC(_itemIDC);
        INC(_itemIndex);
        
        false
    } count _items;
    
    ADD(_totalLabel, CATEGORY_SPACING);
    
    INC(_itemIDC);
    INC(_categoryIDC);
    INC(_categoryIndex);
    
    false
} count _categories;

_footer = _display ctrlCreate ["MARS_gui_ctrlButtonStaticFooter", (_categoryIDC + 1), _headerCtrlGroup];
_footer ctrlSetPosition [0, _totalLabel, (GVAR(AttributesWindow_GlobalWidth) * GRID_W), LABEL_HEIGHT];
_footer ctrlCommit 0;

//--- Disable editor mouse handler and icons
if (!isNil QEFUNC(editor,toggleMouseHandler)) then {
    [false, false] call EFUNC(editor,toggleMouseHandler);
};

if (!isNil QEGVAR(editor,disableSelectionBox)) then {
    EGVAR(editor,disableSelectionBox) = true;
};

GVAR(tempActionConfirm) = getText (_header >> "actionConfirm");
if (!isNil GVAR(tempActionConfirm)) then {GVAR(tempActionConfirm) = format ["_this call %1", GVAR(tempActionConfirm)]};

GVAR(tempActionCancel) = getText (_header >> "actionCancel");

GVAR(AttributesWindow_onCancel) = ["AttributesWindow_onCancel", getText (_header >> "actionCancel")] call EFUNC(common,addEventHandler);

GVAR(AttributesWindow_onConfirm) = ["AttributesWindow_onConfirm", {
    _returnData = [];

    {
        _x params ["_id", "_ctrl"];

        if (_ctrl isEqualType []) then {
            private _ctrlReturnData = [];

            {
                _ctrlReturnData pushBack [
                    (_x getVariable [QGVAR(controlKey), format ["Undefined_%1", _forEachIndex]]),
                    (_x getVariable [QGVAR(execReturnData), controlNull])
                ];
            } forEach _ctrl;

            _returnData pushBack _ctrlReturnData;
        } else {
            _returnData pushBack [
                (_ctrl getVariable [QGVAR(controlKey), format ["Undefined_%1", _forEachIndex]]),
                (_ctrl getVariable [QGVAR(execReturnData), controlNull])
            ];
        };
    } forEach GVAR(identifyControls);

    [_returnData, GVAR(AttributesWindow_GlobalArgs)] call compile GVAR(tempActionConfirm);

    GVAR(identifyControls) = [];
    GVAR(AttributesWindow_GlobalArgs) = [];
}] call EFUNC(common,addEventHandler);

(_display displayCtrl IDC_EDITATTRIBUTES_BTN_OK) ctrlAddEventHandler ["MouseButtonClick", {["AttributesWindow_onConfirm", _this] call EFUNC(common,localEvent)}];
(_display displayCtrl IDC_EDITATTRIBUTES_BTN_CANCEL) ctrlAddEventHandler ["MouseButtonClick", {["AttributesWindow_onCancel", _this] call EFUNC(common,localEvent)}];

//--- Set button text if defined
private _confirmText = getText (_header >> "confirmText");
private _cancelText = getText (_header >> "cancelText");
private _evalButtonText = (getNumber (_header >> "evalButtonText")) > 0;

if (_evalButtonText) then {
    _confirmText = GVAR(AttributesWindow_GlobalArgs) call compile _confirmText;
    _cancelText = GVAR(AttributesWindow_GlobalArgs) call compile _cancelText;
};

if (_confirmText != "") then {
    (_display displayCtrl IDC_EDITATTRIBUTES_BTN_OK) ctrlSetText _confirmText;
};

if (_cancelText != "") then {
    (_display displayCtrl IDC_EDITATTRIBUTES_BTN_CANCEL) ctrlSetText _cancelText;
};
