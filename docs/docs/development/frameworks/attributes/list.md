---
layout: docsPage
title: List
description: List box containing labels and hidden values. Can also be a multi-select list.
---

**There is also LIST_RIGHT which is the exact same but aligns elements to the right.**

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
            <td>multi</td>
            <td>boolean</td>
            <td>false</td>
            <td>Allow multi-selection on the list box.</td>
        </tr>
        <tr>
            <td>labels</td>
            <td>string/array</td>
            <td>[]</td>
            <td>Text to use for each item. You can either provide an array of strings or a code string that returns an array of strings</td>
        </tr>
        <tr>
            <td>values</td>
            <td>string/array</td>
            <td>[]</td>
            <td>Values to use for each item (<a href="https://community.bistudio.com/wiki/lbSetData">lbSetData</a>). You can either provide an array of values or a code string that returns an array of values</td>
        </tr>
        <tr>
            <td>selected</td>
            <td>string/array/number</td>
            <td>-1</td>
            <td>Items to be selected on load. Can be a code string that returns an array of indexes (numbers) or just a single index.</td>
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
class Players {
    condition = "true";
    type = "LIST";
    multi = true;
    labels = "(allPlayers apply {name _x})";
    values = "(allPlayers apply {getPlayerUID _x})";
    expression = "systemChat str _this";
};
```
