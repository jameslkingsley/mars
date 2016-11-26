---
layout: docsPage
title: Combo
description: Combo box control. Contains the label and value in the returned data.
---

# Properties

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>condition</td>
            <td>string</td>
            <td>"true"</td>
            <td>Condition that must return true to show the control.</td>
        </tr>
        <tr>
            <td>values</td>
            <td>string/array</td>
            <td>[]</td>
            <td>Values to use for each combo box item (<a href="https://community.bistudio.com/wiki/lbSetData">lbSetData</a>). You can either provide an array of values or a code string that returns an array of values</td>
        </tr>
        <tr>
            <td>labels</td>
            <td>string/array</td>
            <td>[]</td>
            <td>Text to use for each combo box item. You can either provide an array of strings or a code string that returns an array of strings</td>
        </tr>
        <tr>
            <td>selected</td>
            <td>number/string</td>
            <td>""</td>
            <td>Default selected option when first creating the control. It must match the data type of the items in <code>values</code>. If it’s a string then it’s <code>call compile</code>'d and must return the value</td>
        </tr>
        <tr>
            <td>expression</td>
            <td>string</td>
            <td>""</td>
            <td>Code to run when the user presses the final OK button. It will only run if the value of the control changes</td>
        </tr>
    </tbody>
</table>

# Events
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>onLBSelChanged</td>
            <td>Fires when the selection in the combo box has changed. The left mouse button has been released and the new selection is fully made.</td>
        </tr>
    </tbody>
</table>

# Functions
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>update</td>
            <td>Updates the labels and values. Will simply clear the combo box and re-run the population code again.</td>
        </tr>
    </tbody>
</table>

# Examples
```c++
class Range {
    condition = "true";
    type = "COMBO";
    values[] = {1000, 2000, 3000, 4000, 5000};
    labels[] = {"1000m", "2000m", "3000m", "4000m", "5000m"};
    selected = 1000;
    expression = "[_this, 'range'] call myFnc_doThisFunction";
    onLBSelChanged = "systemChat str _this";
};

class Years {
    condition = "true";
    type = "COMBO";
    values = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack _i}; _years";
    labels = "_years = []; for '_i' from 1982 to 2050 do {_years pushBack str _i}; _years";
    selected = "date select 0";
    expression = "myFnc_doThisFunction";
};
```