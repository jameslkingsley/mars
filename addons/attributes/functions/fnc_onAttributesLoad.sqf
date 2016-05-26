/*
 * Author: Kingsley
 * Handles the attribute load event
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
 * [displayNull, "mars_component_interface"] call mars_attributes_fnc_onAttributesLoad;
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

#define CONTROL(IDC) (_display displayCtrl IDC)

#define ITEM_LABEL_RATIO 0.25
#define ITEM_FIELD_RATIO 0.75
#define ITEM_SPACING GRID_H

#define CATEGORY_TITLE_W (WINDOW_EDITATTRIBUTES_W * GRID_W)
#define CATEGORY_TITLE_H (SIZE_M * GRID_H)
#define CATEGORY_TITLE_X (1 * GRID_W)
#define CATEGORY_TITLE_Y(HEIGHT) (CATEGORY_TITLE_H + (HEIGHT) + ITEM_SPACING)

#define ITEM_TITLE_W ((WINDOW_EDITATTRIBUTES_W * ITEM_LABEL_RATIO) * GRID_W)
#define ITEM_TITLE_H(HEIGHT) ((SIZE_M * GRID_H) + (HEIGHT))
#define ITEM_TITLE_X CATEGORY_TITLE_X
#define ITEM_TITLE_Y(HEIGHT) ITEM_TITLE_H(HEIGHT) + ITEM_SPACING

_parent = (configFile >> QGVARMAIN(attributes) >> _component >> _attribute);

if (!isClass _parent) exitWith {
    MARS_LOGERROR_2("Attribute is not a class: %1 >> %2", _component, _attribute);
};

CONTROL(IDC_EDITATTRIBUTES_TITLE) ctrlSetText getText (_parent >> "displayName");

_categories = "true" configClasses (_parent >> "AttributeCategories");

_categoryIndex = 0;
_categoryHeight = -CATEGORY_TITLE_H;
_categoryIDC = IDC_EDITATTRIBUTES_CATEGORIES * 10;
_ctrlCategoryTitleIDC = _categoryIDC * 10;
_categoryItemIDC = IDC_EDITATTRIBUTES_CATEGORIES_ITEMS * 10;
_itemControlIDC = IDC_EDITATTRIBUTES_CATEGORIES_ITEMS * 100;

{
    _categoryCfg = _x;
    _categoryDisplayName = getText (_categoryCfg >> "displayName");
    _categoryTooltipText = getText (_categoryCfg >> "tooltipText");

    _categoryItems = "true" configClasses (_categoryCfg);

    _ctrlCategoryTitlePosition = [
        CATEGORY_TITLE_X,
        CATEGORY_TITLE_Y(_categoryHeight) + ((_categoryIndex min 1) * CATEGORY_TITLE_H),
        CATEGORY_TITLE_W,
        CATEGORY_TITLE_H
    ];

    _categoryItemIndex = 0;
    _categoryItemHeight = 0;

    {
        _categoryItemCfg = _x;
        _categoryItemDisplayName = getText (_categoryItemCfg >> "displayName");
        _categoryItemTooltipText = getText (_categoryItemCfg >> "tooltipText");
        _categoryItemControls = "true" configClasses (_categoryItemCfg >> "AttributeControls");

        _categoryItemLabel = _display ctrlCreate ["MARS_gui_ctrlButtonStaticAlignRight", _categoryItemIDC, CONTROL(IDC_EDITATTRIBUTES_CATEGORIES)];

        _categoryItemLabel ctrlSetText _categoryItemDisplayName;
        _categoryItemLabel ctrlSetTooltip _categoryItemTooltipText;
        
        _itemControlIndex = 0;
        _itemControlTotalHeight = 0;
        _itemControlWidth = (((WINDOW_EDITATTRIBUTES_W * ITEM_FIELD_RATIO) * GRID_W) - (6 * GRID_W)) / (count _categoryItemControls);
        
        #define ITEM_COMMON_Y ITEM_TITLE_Y(_categoryItemHeight + _categoryHeight + (_categoryItemIndex * GRID_H)) + ((_categoryIndex min 1) * CATEGORY_TITLE_H)
        
        _itemControlLargestHeight = 0;
        
        {
            _itemControlCfg = _x;
            _itemControlCfgPath = [
                "configFile",
                format ["'%1'", QGVARMAIN(attributes)],
                format ["'%1'", _component],
                format ["'%1'", _attribute],
                "'AttributeCategories'",
                format ["'%1'", configName _categoryCfg],
                format ["'%1'", configName _categoryItemCfg],
                "'AttributeControls'",
                format ["'%1'", configName _itemControlCfg]
            ] joinString " >> ";
            
            _itemControlType = getText (_itemControlCfg >> "type");
            _itemControlCreateFunction = format ["%1_fnc_ctrl%2", QGVARMAIN(attributes), _itemControlType];

            if (!isNil _itemControlCreateFunction) then {
                _itemControlCreateCode = format [
                    "[""%1"", %7, %8, [%2,%3,%4,%5]] call %6",
                    _itemControlCfgPath,
                    (ITEM_TITLE_W + GRID_W) + (_itemControlWidth * _itemControlIndex),
                    ITEM_COMMON_Y,
                    _itemControlWidth,
                    SIZE_M * GRID_H,
                    _itemControlCreateFunction,
                    _itemControlIDC,
                    IDC_EDITATTRIBUTES_CATEGORIES
                ];
                
                _itemCtrl = call compile _itemControlCreateCode;
                
                _itemCtrlHeight = (ctrlPosition _itemCtrl) select 3;
                if (_itemCtrlHeight > _itemControlLargestHeight) then {
                    _itemControlLargestHeight = _itemCtrlHeight;
                };
            };
            
            INC(_itemControlIndex);
            INC(_itemControlIDC);

            false
        } count _categoryItemControls;
        
        ADD(_itemControlTotalHeight, _itemControlLargestHeight);

        _categoryItemLabelPosition = [
            ITEM_TITLE_X,
            ITEM_COMMON_Y,
            ITEM_TITLE_W - (1 * GRID_W),
            ITEM_TITLE_H(0)
        ];

        _categoryItemLabel ctrlSetPosition _categoryItemLabelPosition;

        {_x ctrlCommit 0} forEach [_categoryItemLabel];

        ADD(_categoryItemHeight, _itemControlTotalHeight);

        INC(_categoryItemIndex);
        INC(_categoryItemIDC);

        false
    } count _categoryItems;

    ADD(_categoryHeight, ((_categoryIndex min 1) * CATEGORY_TITLE_H));
    ADD(_categoryHeight, _categoryItemHeight);

    INC(_ctrlCategoryTitleIDC);
    INC(_categoryIndex);
    INC(_categoryIDC);

    false
} count _categories;