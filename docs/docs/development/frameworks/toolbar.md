---
layout: docsPage
title: Toolbar
---

# Overview
The toolbar appears underneath the menu strip and hosts buttons that can either be a toggle or just a single-click action. Toolbar options are to be used when you want to quickly enable/disable a feature. An example of this would be to enable/disable night vision mode.

# Usage
All toolbar configs should be kept in a `CfgToolbar.hpp` file, included in the `config.cpp`. Below you will find an example config.

```c++
class mars_toolbar {
    class MyAddonName {
        class night_vision {
            default = false;
            tooltipText = "Night vision";
            iconOn = "\MyAddonName\data\Toolbar\nvg_on_ca.paa";
            iconOff = "\MyAddonName\data\Toolbar\nvg_off_ca.paa";
            action = "_this call myFnc_toggleNightVision";
        };
    };
};
```

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
            <td>default</td>
            <td>bool</td>
            <td>yes</td>
            <td>false</td>
            <td>Whether this toolbar option should enabled upon creation</td>
        </tr>
        <tr>
            <td>tooltipText</td>
            <td>string</td>
            <td>yes</td>
            <td>""</td>
            <td>Tooltip text to show when hovering over the control</td>
        </tr>
        <tr>
            <td>iconOn</td>
            <td>string</td>
            <td>no</td>
            <td>""</td>
            <td>Icon to use when the control is enabled. Refer to this <a href="https://github.com/jameslkingsley/Mars/blob/master/extras/toolbar">template image</a>.</td>
        </tr>
        <tr>
            <td>iconOff</td>
            <td>string</td>
            <td>no</td>
            <td>""</td>
            <td>Icon to use when the control is disabled. Refer to this <a href="https://github.com/jameslkingsley/Mars/blob/master/extras/toolbar">template image</a>.</td>
        </tr>
        <tr>
            <td>action</td>
            <td>string</td>
            <td>no</td>
            <td>""</td>
            <td>Code to execute upon clicking the control. Passed arguments are [enabled(BOOL)]</td>
        </tr>
    </tbody>
</table>
