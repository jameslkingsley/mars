---
layout: docsPage
title: Number
description: Number text box control. Will return number using parseNumber command.
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
            <td>value</td>
            <td>number or string</td>
            <td>nil</td>
            <td>Value of the number box. If string it is compiled as code and must return a numeric value.</td>
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
            <td>onSetFocus</td>
            <td>Input focus is on control. It now begins to accept keyboard input.</td>
        </tr>
        <tr>
            <td>onKillFocus</td>
            <td>Input focus is no longer on control. It no longer accepts keyboard input.</td>
        </tr>
        <tr>
            <td>onKeyDown</td>
            <td>Pressing any keyboard key. Fired before the onKeyUp event.</td>
        </tr>
        <tr>
            <td>onKeyUp</td>
            <td>Releasing any keyboard key. Fired after the onKeyDown event.</td>
        </tr>
    </tbody>
</table>

# Examples
```c++
class ZCord {
    condition = "true";
    type = "NUMBER";
    value = 5;
    expression = "";
};

class Overcast {
    condition = "true";
    type = "NUMBER";
    value = "overcast";
    expression = "";
};
```
