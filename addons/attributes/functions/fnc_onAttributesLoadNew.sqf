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

{
    
    
    false
} count ("true" configClasses (configFile >> QGVARMAIN(attributes) >> _component >> _attribute));
