---
layout: docsPage
title: Attributes
---

# What is the attributes framework?
The attributes framework is quite simply a set of code that handles the UI stuff for you. This means you don't have to spend dozens of hours making your own UI dialog just to set some values. Instead you just write a simple attributes config and call the function to open it.

# Why do I have to use it?
A consistent UI design throughout Mars is a main priority and in order to achieve this, _almost_ all dialogs must be created using the attributes framework. Not only that but it centralises the UI code into a single component, as appose to multiple components all doing their own thing when it comes to UI.

# How do I use it?
1. Add a `CfgAttributes.hpp` file to your component's root folder
2. Place the following config in the file
3. Include `CfgAttributes.hpp` in your `config.cpp` **after** the `script_component.hpp` include
4. Go through the various control types available in the sidebar
5. When you're ready to use your attributes class, just call it using `["MyAddonName", "YourAttributeName"] call mars_attributes_fnc_openAttributes`

```c++
class mars_attributes {
    class MyAddonName {
        class YourAttributeName {
            displayName = "";
            actionConfirm = "";
            actionCancel = "";
            class YourCategoryOne {
                class YourItemOne {
                    displayName = "";
                    tooltipText = "";
                    class YourControlOne {};
                };
            };
        };
    };
};
```

A more fuller example can be found [here](https://github.com/jameslkingsley/Mars/blob/master/addons/environment/CfgAttributes.hpp).

## Identifiers
Identifiers will allow you to return a control from another part of your attribute config. An example usage would be to have a combo box populated with all groups in the mission, and then an edit box with the group ID of the selected group. When you change the combo box, ideally you want it to change the value of the edit box. See below for an example.

```c++
class mars_attributes {
    class MyAddonName {
        class groups {
            displayName = "Group Management";
            actionConfirm = "";
            actionCancel = "";
            class Basics {
                class Select {
                    displayName = "Group";
                    tooltipText = "Select the group to edit.";
                    class List {
                        condition = "true";
                        identifier = "GroupList";
                        type = "COMBO";
                        labels = "\
                            (allGroups select {\
                                {!isPlayer _x} count (units _x) == 0\
                            }) apply {format ['%1 (%2)', groupID _x, name leader _x]}\
                        ";
                        values = "\
                            (allGroups select {\
                                {!isPlayer _x} count (units _x) == 0\
                            }) apply {getPlayerUID (leader _x)}\
                        ";
                        selected = "getPlayerUID (leader player)";
                        expression = "";
                    };
                };
                class Name {
                    displayName = "Name";
                    tooltipText = "The name of the group appears on its map marker.";
                    class Name {
                        condition = "true";
                        type = "EDIT";
                        textCode = "\
                            private _groupCtrl = ['GroupList'] call mars_attributes_fnc_getControl;\
                            private _leaderUID = _groupCtrl lbData (lbCurSel _groupCtrl);\
                            private _group = (allGroups select {getPlayerUID (leader _x) == _leaderUID}) select 0;\
                            groupID _group\
                        ";
                        expression = "";
                    };
                };
            };
        };
    };
};
```

## Control values
This only applies to the `actionConfirm` property. If you want the user to fill out a form with some data and then process it all at once in one place then you would call a function in `actionConfirm`. From there you can get the value of each control by doing the following:

```c++
class mars_attributes {
    class MyAddonName {
        class Example {
            displayName = "Example";
            actionConfirm = "\
                _myControl = [_this, 'MyCategory_MyItem_MyControl'] call mars_attributes_fnc_getControlValue;\
                systemChat str _myControl;\
            ";
            class MyCategory {
                class MyItem {
                    class MyControl {};
                };
            };
        };
    };
};
```

The string represents the control key (generated for every control) which is simply the category class name, item class name and control class name joined by underscores. This allows you to reorder your attribute config and not worry about parameter order.

## Enabling/Disabling Control Sets
A control set is a collection of controls and their labels. This would typically be all the controls in an item as well as the item label. You can enable/disable control sets by doing the following.

```
private _control = ["ControlIdentifier"] call mars_attributes_fnc_getControl;
[_control, false] call mars_attributes_fnc_enableControlSet;
```

This is particularly useful for disabling controls when changing a value of another control.

## Control Functions
Some control types have functions embedded in them that you can execute to reduce duplicate code. For example if you have a list box and a combo box, and you want to have the combo box update with the values selected in the list box, you can add an event handler to the list box to update the combo box, such as the following.

```
private _comboBox = ["ComboBox"] call mars_attributes_fnc_getControl;
[_comboBox, "update"] call mars_attributes_fnc_execControlFunction;
```

## Window Size
You can change the size of the overall window by simply providing another parameter to `openAttributes` such as `["MyAddonName", "YourAttributeName", [75, 50]] call mars_attributes_fnc_openAttributes`. The first element in the array is the width, the second is the height.

## Label and field ratios
You can change the ratio of the labels and fields by providing another parameter to `openAttributes` such as `["MyAddonName", "YourAttributeName", nil, [0.33, 0.66]] call mars_attributes_fnc_openAttributes`. The first element in the array is the scale of the label, the second element is the scale of the field.

## Storing attributes in the mission config
You can also create attribute configs straight into the mission by placing the config in the `description.ext`. The attributes framework will first search for the given config in the main `configFile` and lastly check `missionConfigFile`.

## Confirmation Function
If you just need a confirmation box then you can use the built-in function.<br />See below for an example, and see this link for docs.

```
[
    // Window title
    "Kill Unit",

    // Message
    "Are you sure you want to kill the unit?",

    // Yes button text
    "Yes",

    // No button text
    "No",

    // Yes code
    {_this setDamage 1},

    // No code
    {},

    // Arguments
    _unit
] call mars_attributes_fnc_confirmation;
```

## Control Types
{% include dir_table.html context="/docs/development/frameworks/attributes/" order="path" recursive=false %}
