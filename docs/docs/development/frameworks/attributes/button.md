---
layout: docsPage
title: Button
description: A button control that can only be pressed (does not store a value).
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
            <td>Text to show on the button</td>
        </tr>
        <tr>
            <td>textCode</td>
            <td>string</td>
            <td>""</td>
            <td>Code that returns the text to show on the button</td>
        </tr>
        <tr>
            <td>action</td>
            <td>string</td>
            <td>""</td>
            <td>Code to run when pressing button</td>
        </tr>
    </tbody>
</table>

# Examples
```c++
class Button {
    condition = "alive player";
    type = "BUTTON";
    textCode = "name player";
    action = "hint format ['Your name is %1', name player]";
};
```
