---
layout: docsPage
title: Marker Color
description: Marker color combo box control. Contains the marker color string in the returned data.
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
            <td>selected</td>
            <td>string</td>
            <td>""</td>
            <td>Value that is selected. Must be the name of a marker color.</td>
        </tr>
        <tr>
            <td>evalSelected</td>
            <td>bool</td>
            <td>0</td>
            <td>Whether to evaluate the given selected property. If evalSelected is 1 then the selected property must return a marker color string.</td>
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

# Examples
```c++
class Color {
    condition = "true";
    type = "MARKERCOLOR";
    selected = "ColorBlue";
    expression = "";
};

class Color {
    condition = "true";
    type = "MARKERCOLOR";
    selected = "markerColor 'myMarker'";
    evalSelected = 1;
    expression = "";
};
```