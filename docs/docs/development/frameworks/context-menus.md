---
layout: docsPage
title: Context Menus
---

# Overview
Context menus appear when right-clicking in the Mars editor. You can setup context menus to only appear based on the given condition, such as `_this isKindOf "Air"` if you only want the option to appear for air vehicles. Context menus are also recursive, meaning you can have an infinite number of child menus (in theory) - however the goal is to make the UI concise for the end user so refrain from creating a dozen child menus.

# Implementation
1. Create `CfgContext.hpp` in your addon's root directory
2. Put `#include "CfgContext.hpp"` in your addon's `config.cpp`
3. Inside `CfgContext.hpp` is where you'll define your menu. See below for an example

```c++
class mars_context {
    class MyAddonName {
        class MyAmazingContext {
            displayName = "My Amazing Context";
            requiresPosition = false;
            condition = "_this isKindOf 'Air'";
            action = "";
            class MyAction1 {
                displayName = "Action 1";
                requiresPosition = false;
                condition = "alive _this";
                action = "_this call myFnc_myAction1";
            };
            class MyAction2 {
                displayName = "Action 2";
                requiresPosition = false;
                condition = "alive _this";
                action = "_this call myFnc_myAction2";
            };
        };
    };
};
```

As you can see we're defining the context menu inside the addon's class. Each class inside the addon's class is its own context option (top-level) and then anything inside it is a child menu and so on. All actions should just call a file; don't have SQF code inside your config!

# Attributes
<table>
    <thead>
        <tr>
            <th>Attribute</th>
            <th>Type</th>
            <th>Optional</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>displayName</td>
            <td>string</td>
            <td>no</td>
            <td>""</td>
            <td>Text to show to the end user in the context menu</td>
        </tr>
        <tr>
            <td>requiresPosition</td>
            <td>bool</td>
            <td>yes</td>
            <td>false</td>
            <td>If set to true, it will require the user to click on a position after clicking on the context option. The position is then passed to the <code>action</code> in <code>_this</code></td>
        </tr>
        <tr>
            <td>condition</td>
            <td>string</td>
            <td>yes</td>
            <td>"true"</td>
            <td>Code that must return true for the option to be shown. Passed object is <code>_this</code>. Conditions can block child menus, for example if a top-level option’s condition fails, then it won’t show any of the child menus even if they return true. If the user has multiple objects selected then the condition must pass true for every object in selection to show the option. Leaving the <code>condition</code> empty will default it to <code>true</code></td>
        </tr>
        <tr>
            <td>action</td>
            <td>string</td>
            <td>no</td>
            <td>""</td>
            <td>Code to execute when the user clicks the option. This should always just call a function. Arguments are passed in <code>_this</code></td>
        </tr>
    </tbody>
</table>
