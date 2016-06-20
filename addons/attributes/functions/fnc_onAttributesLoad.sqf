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

CONTROL(IDC_EDITATTRIBUTES_TITLE) ctrlSetText getText (_header >> "displayName");
_headerCtrlGroup = CONTROL(IDC_EDITATTRIBUTES_CATEGORIES);

_categories = "true" configClasses (_header >> "AttributeCategories");
_categoryIndex = 0;
_categoryIDC = IDC_EDITATTRIBUTES_CATEGORIES * 10;
_ctrlIDC = IDC_EDITATTRIBUTES_CATEGORIES * 1000;

_totalLabel = CATEGORY_Y_IOFFSET + ITEM_SPACING;
_totalField = 0;

{
    // Categories
    _catConfig = _x;
    _catPosX = CATEGORY_X;
    _catPosY = CATEGORY_Y;
    _catPosW = 0;
    
    _items = "true" configClasses (_catConfig >> "AttributeItems");
    _itemIDC = IDC_EDITATTRIBUTES_CATEGORIES * 100;
    _itemIndex = 0;
    
    {
        // Items
        _itemConfig = _x;
        _itemControls = "true" configClasses (_itemConfig >> "AttributeControls");
        _itemLabelY = LABEL_HEIGHT + ITEM_SPACING;
        _itemLabel = _display ctrlCreate ["MARS_gui_ctrlButtonStaticAlignRight", _itemIDC, _headerCtrlGroup];
        _itemLabel ctrlSetText getText (_itemConfig >> "displayName");
        _itemLabel ctrlSetTooltip getText (_itemConfig >> "tooltipText");
        
        _ctrlIndex = 0;
        _ctrlLargestHeight = 0;
        _ctrlIWidth = FIELD_WIDTH / count _itemControls;
        
        {
            // Controls
            _ctrlConfig = _x;
            
            _ctrlConfigPath = [
                _requiredConfig,
                format ["'%1'", QGVARMAIN(attributes)],
                format ["'%1'", _component],
                format ["'%1'", _attribute],
                "'AttributeCategories'",
                format ["'%1'", configName _catConfig],
                "'AttributeItems'",
                format ["'%1'", configName _itemConfig],
                "'AttributeControls'",
                format ["'%1'", configName _ctrlConfig]
            ] joinString " >> ";
            
            _ctrlType = getText (_ctrlConfig >> "type");
            _ctrlCreateFunction = format ["%1_fnc_ctrl%2", QGVARMAIN(attributes), _ctrlType];

            if (!isNil _ctrlCreateFunction) then {
                _ctrlCreateCode = format [
                    "[""%1"", %7, %8, [%2,%3,%4,%5]] call %6",
                    _ctrlConfigPath,
                    CATEGORY_SPACING + LABEL_WIDTH + GRID_W + (_ctrlIndex * _ctrlIWidth),
                    _totalLabel + _itemLabelY,
                    _ctrlIWidth,
                    LABEL_HEIGHT,
                    _ctrlCreateFunction,
                    _ctrlIDC,
                    IDC_EDITATTRIBUTES_CATEGORIES
                ];
                
                _ctrlRet = call compile _ctrlCreateCode;

                if (!isNull (_ctrlConfig >> "identifier")) then {
                    GVAR(identifyControls) pushBack [getText (_ctrlConfig >> "identifier"), _ctrlRet];
                } else {
                    GVAR(identifyControls) pushBack [format ["__Ctrl%1", _ctrlIDC], _ctrlRet];
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
                    
                    if !(call compile getText (_ctrlConfig >> "condition")) then {
                        _itemLabel ctrlEnable false;
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
                    
                    if !(call compile getText (_ctrlConfig >> "condition")) then {
                        _itemLabel ctrlEnable false;
                        _ctrlRet ctrlEnable false;
                        {_x ctrlEnable false} forEach (_ctrlRet getVariable [QGVAR(siblings), []]);
                    };
                };                
            };
            
            INC(_ctrlIDC);
            INC(_ctrlIndex);
            
            false
        } count _itemControls;
        
        _itemLabelPosY = [(_totalLabel + _itemLabelY), ((_totalLabel + _itemLabelY) - _ctrlLargestHeight) + CATEGORY_SPACING] select (_ctrlLargestHeight > LABEL_HEIGHT);
        _itemLabel ctrlSetPosition [CATEGORY_SPACING, _itemLabelPosY, LABEL_WIDTH, LABEL_HEIGHT];
        _itemLabel ctrlCommit 0;
        
        ADD(_totalLabel, _itemLabelY);
        
        INC(_itemIDC);
        INC(_itemIndex);
        
        false
    } count _items;
    
    ADD(_totalLabel, CATEGORY_SPACING);
    
    INC(_categoryIDC);
    INC(_categoryIndex);
    
    false
} count _categories;

_footer = _display ctrlCreate ["MARS_gui_ctrlButtonStaticFooter", (_categoryIDC + 1), _headerCtrlGroup];
_footer ctrlSetPosition [0, _totalLabel, (GVAR(AttributesWindow_GlobalWidth) * GRID_W), LABEL_HEIGHT];
_footer ctrlCommit 0;

GVAR(tempActionConfirm) = getText (_header >> "actionConfirm");
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

    _returnData call compile GVAR(tempActionConfirm);

    GVAR(identifyControls) = [];
}] call EFUNC(common,addEventHandler);

(_display displayCtrl IDC_EDITATTRIBUTES_BTN_OK) ctrlAddEventHandler ["MouseButtonClick", {["AttributesWindow_onConfirm", _this] call EFUNC(common,localEvent)}];
(_display displayCtrl IDC_EDITATTRIBUTES_BTN_CANCEL) ctrlAddEventHandler ["MouseButtonClick", {["AttributesWindow_onCancel", _this] call EFUNC(common,localEvent)}];
