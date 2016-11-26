---
layout: docsPage
title: Date
description: Date control (year, month, day). Shows full/half moons and also handles leap years.
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
            <td>year</td>
            <td>number/string</td>
            <td>0</td>
            <td>Default year value. If code string, it must return a number</td>
        </tr>
        <tr>
            <td>month</td>
            <td>number/string</td>
            <td>0</td>
            <td>Default month value. If code string, it must return a number</td>
        </tr>
        <tr>
            <td>day</td>
            <td>number/string</td>
            <td>0</td>
            <td>Default day value. If code string, it must return a number</td>
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
class Date {
    condition = "true";
    type = "DATE";
    year = "date select 0";
    month = "date select 1";
    day = "date select 2";
    expression = "myFnc_setDateTime";
};

class FixedDate {
    condition = "true";
    type = "DATE";
    year = 1945;
    month = 11;
    day = 11;
    expression = "myFnc_setDateTime";
};
```
