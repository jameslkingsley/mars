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

params [
    ["_display", displayNull, [displayNull]],
    ["_component", "", [""]],
    ["_attribute", "", [""]]
];

#define CONTROL(IDC) (_display displayCtrl IDC)

_parent = (configFile >> QGVARMAIN(attributes) >> _component >> _attribute);

// Exit with an error if the parent is not a class
if (!isClass _parent) exitWith {
    MARS_LOGERROR_2("Attribute is not a class: %1 >> %2", _component, _attribute);
};

// Set the title of the parent
CONTROL(IDC_EDITATTRIBUTES_TITLE) ctrlSetText getText (_parent >> "displayName");

_categories = "true" configClasses (_parent >> "AttributeCategories");