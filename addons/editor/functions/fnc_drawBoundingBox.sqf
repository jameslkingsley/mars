/*
 * Author: Kingsley
 * Draws a bounding box around the given object in 3D space
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Color (optional) <RGBA ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [1,0,0,1]] call mars_editor_fnc_drawBoundingBox;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_target", objNull], ["_color", [1,1,1,1]]];

if (isNull _target) exitWith {};

_color set [3,0.33];
(boundingBoxReal _target) params ["_box0", "_box1"];

{
    drawLine3D [
        _target modelToWorldVisual (_x select 0),
        _target modelToWorldVisual (_x select 1),
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
