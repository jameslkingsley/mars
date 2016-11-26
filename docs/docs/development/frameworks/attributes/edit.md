---
layout: docsPage
title: Edit
description: Edit text box control. Can have a custom number of rows (more than one turns it into a code box).
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
            <td>rows</td>
            <td>number</td>
            <td>0</td>
            <td>Number of rows to draw (more than 1 will result in a multi-line edit box)</td>
        </tr>
        <tr>
            <td>textPlain</td>
            <td>string</td>
            <td>""</td>
            <td>Text value to be placed into the edit box</td>
        </tr>
        <tr>
            <td>textCode</td>
            <td>string</td>
            <td>""</td>
            <td>Code that returns the text value to be placed into the edit box</td>
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
class Summary {
    condition = "true";
    type = "EDIT";
    rows = 5;
    textPlain = "";
    expression = "";
};

class Name {
    condition = "true";
    type = "EDIT";
    rows = 1;
    textCode = "name player";
    expression = "";
};
```
