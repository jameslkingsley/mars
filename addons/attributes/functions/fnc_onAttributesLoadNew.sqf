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
 * [displayNull, "mars_environment", "environment"] call mars_attributes_fnc_onAttributesLoadNew;
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
#define LABEL_RATIO 0.25
#define FIELD_RATIO 0.75
#define CATEGORY_Y_IOFFSET -GRID_H
#define CATEGORY_SPACING (SIZE_M * GRID_H)
#define CATEGORY_X CATEGORY_SPACING
#define CATEGORY_Y CATEGORY_SPACING
#define LABEL_WIDTH ((WINDOW_EDITATTRIBUTES_W * LABEL_RATIO) * GRID_W)
#define LABEL_HEIGHT (SIZE_M * GRID_H)
#define FIELD_WIDTH ((WINDOW_EDITATTRIBUTES_W * FIELD_RATIO) * GRID_W)

_header = (configFile >> QGVARMAIN(attributes) >> _component >> _attribute);

if (!isClass _header) exitWith {
    MARS_LOGERROR_2("Attribute is not a class: %1 >> %2", _component, _attribute);
};

CONTROL(IDC_EDITATTRIBUTES_TITLE) ctrlSetText getText (_header >> "displayName");
_headerCtrlGroup = CONTROL(IDC_EDITATTRIBUTES_CATEGORIES);

_categories = "true" configClasses (_header >> "AttributeCategories");
_categoryIndex = 0;
_categoryIDC = IDC_EDITATTRIBUTES_CATEGORIES * 10;

{
    // Categories
    _catConfig = _x;
    _catPosX = CATEGORY_X;
    _catPosY = CATEGORY_Y + (0);
    _catPosW = 0;
    _catPosH = 0;
    
    _items = "true" configClasses (_catConfig >> "AttributeItems");
    _itemIDC = IDC_EDITATTRIBUTES_CATEGORIES * 100;
    _itemIndex = 0;
    
    {
        // Items
        _itemConfig = _x;
        _itemControls = "true" configClasses (_itemConfig >> "AttributeControls");
        _itemLabelY = 0;
        _itemLabel = _display ctrlCreate ["MARS_gui_ctrlButtonStaticAlignRight", _itemIDC, _headerCtrlGroup];
        _itemLabel ctrlSetText getText (_itemConfig >> "displayName");
        _itemLabel ctrlSetTooltip getText (_itemConfig >> "tooltipText");
        
        _ctrlIDC = IDC_EDITATTRIBUTES_CATEGORIES * 1000;
        _ctrlIndex = 0;
        
        {
            // Controls
            _ctrlConfig = _x;
            
            ADD(_catPosH, 0); // Add control height
            
            INC(_ctrlIDC);
            INC(_ctrlIndex);
            
            false
        } count _itemControls;
        
        _itemLabel ctrlSetPosition [CATEGORY_SPACING, _itemLabelY + CATEGORY_Y_IOFFSET, LABEL_WIDTH, LABEL_HEIGHT];
        _itemLabel ctrlCommit 0;
        
        INC(_itemIDC);
        INC(_itemIndex);
        
        false
    } count _items;
    
    INC(_categoryIDC);
    INC(_categoryIndex);
    
    false
} count _categories;