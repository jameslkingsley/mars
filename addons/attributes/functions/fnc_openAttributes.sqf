/*
 * Author: Kingsley
 * Opens the given attributes window
 *
 * Arguments:
 * 0: Component <STRING>
 * 1: Attribute class <STRING>
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
        ["_attribute", "", [""]]
    ];
    
    if (dialog) then {
        closeDialog 0;
        ["AttributesWindow_onLoad", GVAR(AttributesWindow_onLoad)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onUnload", GVAR(AttributesWindow_onUnload)] call EFUNC(common,removeEventHandler);
    };

    GVAR(AttributesWindow_onLoad) = ["AttributesWindow_onLoad",
        compile format ["[_this select 0, '%1', '%2'] call " + QUOTE(FUNC(onAttributesLoad)), _component, _attribute]
    ] call EFUNC(common,addEventHandler);
    
    GVAR(AttributesWindow_onUnload) = ["AttributesWindow_onUnload", {
        ["AttributesWindow_onLoad", GVAR(AttributesWindow_onLoad)] call EFUNC(common,removeEventHandler);
        ["AttributesWindow_onUnload", GVAR(AttributesWindow_onUnload)] call EFUNC(common,removeEventHandler);
    }] call EFUNC(common,addEventHandler);
    
    createDialog QGVAR(attributesWindow);
};