/*
 * Author: Kingsley
 * Opens the given attributes window
 *
 * Arguments:
 * 0: Component <STRING>
 * 1: Attribute class <STRING>
 * 2: Size of window [width, height] (optional) <ARRAY>
 * 3: Ratio of labels and fields [label, field] (optional) <ARRAY>
 * 4: Arguments to pass to actionConfirm (optional) <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["mars_environment", "environment"] call mars_attributes_fnc_openAttributes;
 *
 * Public: Yes
 */

#include "script_component.hpp"

_this spawn {
    params [
        ["_component", "", [""]],
        ["_attribute", "", [""]],
        ["_size", [140, 180], [[]]],
        ["_ratio", [0.25, 0.75], [[]]],
        ["_args", []]
    ];

    _size params [
        ["_width", WINDOW_EDITATTRIBUTES_W, [0]],
        ["_height", WINDOW_EDITATTRIBUTES_H, [0]]
    ];

    _ratio params [
        ["_labelR", 0.25, [0]],
        ["_fieldR", 0.75, [0]]
    ];

    GVAR(AttributesWindow_GlobalWidth) = _width;
    GVAR(AttributesWindow_GlobalHeight) = _height;

    GVAR(AttributesWindow_GlobalLabelRatio) = _labelR;
    GVAR(AttributesWindow_GlobalFieldRatio) = _fieldR;
    
    GVAR(AttributesWindow_GlobalArgs) = _args;
    
    if (dialog) then {
        closeDialog 0;
        GVAR(AttributesWindow_ItemControls) = [];
        GVAR(identifyControls) = [];
        GVAR(AttributesWindow_GlobalArgs) = [];
        ["AttributesWindow_onLoad", GVAR(AttributesWindow_onLoad)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onUnload", GVAR(AttributesWindow_onUnload)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onConfirm", GVAR(AttributesWindow_onConfirm)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onCancel", GVAR(AttributesWindow_onCancel)] call EFUNC(common,removeEventHandler);
    };

    GVAR(AttributesWindow_onLoad) = ["AttributesWindow_onLoad",
        compile format ["[(_this select 0), '%1', '%2'] call " + QUOTE(FUNC(onAttributesLoad)), _component, _attribute]
    ] call EFUNC(common,addEventHandler);
    
    GVAR(AttributesWindow_onUnload) = ["AttributesWindow_onUnload", {
        GVAR(isOpen) = false;
        GVAR(AttributesWindow_ItemControls) = [];
        GVAR(identifyControls) = [];
        GVAR(AttributesWindow_GlobalArgs) = [];
        ["AttributesWindow_onLoad", GVAR(AttributesWindow_onLoad)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onUnload", GVAR(AttributesWindow_onUnload)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onConfirm", GVAR(AttributesWindow_onConfirm)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onCancel", GVAR(AttributesWindow_onCancel)] call EFUNC(common,removeEventHandler);
    }] call EFUNC(common,addEventHandler);

    GVAR(AttributesWindow_onConfirm) = ["AttributesWindow_onConfirm", {
        closeDialog 0;
    }] call EFUNC(common,addEventHandler);
    
    GVAR(AttributesWindow_onCancel) = ["AttributesWindow_onCancel", {
        closeDialog 0;
    }] call EFUNC(common,addEventHandler);
    
    createDialog QGVAR(attributesWindow);
};