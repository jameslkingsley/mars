---
layout: docsPage
title: Map
description: Map control that shows markers. Returns the selected position (3D).
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
            <td>position</td>
            <td>array/string</td>
            <td>[]</td>
            <td>Position array to center the map control on. If string is provided, it will be compiled and must return a position array</td>
        </tr>
        <tr>
            <td>expression</td>
            <td>string</td>
            <td>""</td>
            <td>Code to run when the user presses the final OK button. It will only run if the designated position of the map control changes (user clicks a position on the map)</td>
        </tr>
    </tbody>
</table>

# Examples
```c++
class Map1 {
    condition = "true";
    type = "MAP";
    position[] = {0, 0, 0};
};

class Map2 {
    condition = "true";
    type = "MAP";
    position = "getPos player";
};
```
