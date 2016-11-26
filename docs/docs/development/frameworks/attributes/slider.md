---
layout: docsPage
title: Slider
description: Slider control that returns the position within the given range.
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
            <td>range</td>
            <td>array</td>
            <td>[]</td>
            <td>Min and max range for the slider</td>
        </tr>
        <tr>
            <td>step</td>
            <td>number</td>
            <td>0</td>
            <td>Step to use when pressing left/right on the slider</td>
        </tr>
        <tr>
            <td>position</td>
            <td>number/string</td>
            <td>""</td>
            <td>Default position when first creating the control. It must be within the range. If it’s a string then it’s <code>call compile</code>'d and must return the position number</td>
        </tr>
        <tr>
            <td>expression</td>
            <td>string</td>
            <td>""</td>
            <td>Code to run when the user presses the final OK button. It will only run if the position of the control changes</td>
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
            <td>onSliderPosChanged</td>
            <td>Fires when changing the position of the slider.</td>
        </tr>
    </tbody>
</table>

# Examples
```c++
class Overcast {
    condition = "true";
    type = "SLIDER";
    range[] = {0, 1};
    step = 0.1;
    position = "overcast";
    expression = "";
    onSliderPosChanged = "\
        _ctrl = _this select 0;\
        _ctrl ctrlSetTooltip str (sliderPosition _ctrl);\
    ";
};

class Range {
    condition = "true";
    type = "SLIDER";
    range[] = {0, 1000};
    step = 100;
    position = 500;
    expression = "";
    onSliderPosChanged = "";
};
```
