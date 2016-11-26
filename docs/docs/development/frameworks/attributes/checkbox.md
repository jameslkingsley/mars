---
layout: docsPage
title: Checkbox
description: Checkbox control containing a true/false boolean value.
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
            <td>textPlain</td>
            <td>string</td>
            <td>""</td>
            <td>Text to show on the checkbox's label</td>
        </tr>
        <tr>
            <td>textCode</td>
            <td>string</td>
            <td>""</td>
            <td>Code that returns the text to show on the checkbox's label</td>
        </tr>
        <tr>
            <td>checked</td>
            <td>bool/string</td>
            <td>false</td>
            <td>Whether the checkbox should already be checked. If a string is provided instead of a bool, it will be compiled and must return a boolean value</td>
        </tr>
        <tr>
            <td>expression</td>
            <td>string</td>
            <td>""</td>
            <td>Code to run when the user presses the final OK button. It will only run if the value of the control changes</td>
        </tr>
    </tbody>
</table>

# Examples
```c++
class Checkbox1 {
    condition = "true";
    type = "CHECKBOX";
    textPlain = "Enable/Disable Something";
    checked = false;
};

class Checkbox2 {
    condition = "true";
    type = "CHECKBOX";
    textCode = "name player";
    checked = "alive player";
};
```
