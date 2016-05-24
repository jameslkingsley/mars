/*
 * Author: Kingsley, 654wak654
 * Draws a bounding box around the given object in 3D space
 * Must be called every frame
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Color (optional) <RGBA ARRAY>
 * 2: Offset in world position (AGL) (optional) <ARRAY>
 * 3: Rotation of bounding box (optional) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [1,0,0,1], [0,0,0], 45] call mars_editor_fnc_drawBoundingBox;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_target", objNull, [objNull]],
    ["_color", [1,1,1,1], [[]]],
    ["_offset", [0,0,0], [[]]],
    ["_rotation", 0, [0]]
];

if (isNull _target) exitWith {};

_color set [3, [0.33, 1] select (_target in GVAR(selection))];
(boundingBoxReal _target) params ["_box0", "_box1"];

{
    _x params ["_start", "_end"];
    if (_rotation > 0) then {
        _rotation = (_rotation % 360) - 360;
        _start = [
            ((_start select 0) * cos _rotation) - ((_start select 1) * sin _rotation),
            ((_start select 0) * sin _rotation) + ((_start select 1) * cos _rotation),
            _start select 2
        ];
        _end = [
            ((_end select 0) * cos _rotation) - ((_end select 1) * sin _rotation),
            ((_end select 0) * sin _rotation) + ((_end select 1) * cos _rotation),
            _end select 2
        ];
    };
    drawLine3D [
        (_target modelToWorldVisual _start) vectorAdd _offset,
        (_target modelToWorldVisual _end) vectorAdd _offset,
        _color
    ];

    false
} count [
    // Left Front Bottom -> Right Front Bottom
    [
        _box0,
        [_box1 select 0, _box0 select 1, _box0 select 2]
    ],

    // Left Front Bottom -> Left Back Bottom
    [
        _box0,
        [_box0 select 0, _box1 select 1, _box0 select 2]
    ],

    // Left Front Bottom -> Left Front Top
    [
        _box0,
        [_box0 select 0, _box0 select 1, _box1 select 2]
    ],

    // Right Back Top -> Left Back Top
    [
        _box1,
        [_box0 select 0, _box1 select 1, _box1 select 2]
    ],

    // Right Back Top -> Right Front Top
    [
        _box1,
        [_box1 select 0, _box0 select 1, _box1 select 2]
    ],

    // Right Back Top -> Right Back Bottom
    [
        _box1,
        [_box1 select 0, _box1 select 1, _box0 select 2]
    ],

    // Right Back Bottom -> Right Front Bottom
    [
        [_box1 select 0, _box1 select 1, _box0 select 2],
        [_box1 select 0, _box0 select 1, _box0 select 2]
    ],

    // Right Front Top -> Left Front Top
    [
        [_box1 select 0, _box0 select 1, _box1 select 2],
        [_box0 select 0, _box0 select 1, _box1 select 2]
    ],

    // Right Front Bottom -> Right Front Top
    [
        [_box1 select 0, _box0 select 1, _box0 select 2],
        [_box1 select 0, _box0 select 1, _box1 select 2]
    ],

    // Left Back Top -> Left Front Top
    [
        [_box0 select 0, _box1 select 1, _box1 select 2],
        [_box0 select 0, _box0 select 1, _box1 select 2]
    ],

    // Left Back Top -> Left Back Bottom
    [
        [_box0 select 0, _box1 select 1, _box1 select 2],
        [_box0 select 0, _box1 select 1, _box0 select 2]
    ],

    // Left Back Bottom -> Right Back Bottom
    [
        [_box0 select 0, _box1 select 1, _box0 select 2],
        [_box1 select 0, _box1 select 1, _box0 select 2]
    ]
];