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

private _box = boundingBoxReal _target;

{
    {
        drawLine3D [
            (_target modelToWorld (_x select 0)),
            (_target modelToWorld (_x select 1)),
            _color
        ];
    } forEach _x;
} forEach [
    // Left
    [
        // P1 to P2
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Left
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 0 select 2)] // Top Front Left
        ],
        
        // P1 to P4
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Left
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Left
        ],
        
        // P2 to P3
        [
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 0 select 2)], // Top Front Left
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 1 select 2)] // Top Back Left
        ],
        
        // P3 to P4
        [
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 1 select 2)], // Top Back Left
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Left
        ]
    ],
    
    // Right
    [
        // P1 to P2
        [
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Right
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 0 select 2)] // Top Front Right
        ],
        
        // P1 to P4
        [
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Right
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Right
        ],
        
        // P2 to P3
        [
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 0 select 2)], // Top Front Right
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 1 select 2)] // Top Back Right
        ],
        
        // P3 to P4
        [
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 1 select 2)], // Top Back Right
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Right
        ]
    ],
    
    // Top
    [
        // P1 to P2
        [
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 0 select 2)], // Top Front Left
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 1 select 2)] // Top Back Left
        ],
        
        // P1 to P4
        [
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 0 select 2)], // Top Front Left
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 0 select 2)] // Top Front Right
        ],
        
        // P2 to P3
        [
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 1 select 2)], // Top Back Left
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 1 select 2)] // Top Back Right
        ],
        
        // P3 to P4
        [
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 1 select 2)], // Top Back Right
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 0 select 2)] // Top Front Right
        ]
    ],
    
    // Bottom
    [
        // P1 to P2
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Left
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Left
        ],
        
        // P1 to P4
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Left
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 0 select 2)] // Bottom Front Right
        ],
        
        // P2 to P3
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 1 select 2)], // Bottom Back Left
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Right
        ],
        
        // P3 to P4
        [
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 1 select 2)], // Bottom Back Right
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 0 select 2)] // Bottom Front Right
        ]
    ],
    
    // Front
    [
        // P1 to P2
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Left
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 0 select 2)] // Top Front Left
        ],
        
        // P1 to P4
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 0 select 2)], // Bottom Front Left
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 0 select 2)] // Bottom Front Right
        ],
        
        // P2 to P3
        [
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 0 select 2)], // Top Front Left
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 0 select 2)] // Top Front Right
        ],
        
        // P3 to P4
        [
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 0 select 2)], // Top Front Right
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 0 select 2)] // Bottom Front Right
        ]
    ],
    
    // Back
    [
        // P1 to P2
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 1 select 2)], // Bottom Back Left
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 1 select 2)] // Top Back Left
        ],
        
        // P1 to P4
        [
            [(_box select 0 select 0), (_box select 0 select 1), (_box select 1 select 2)], // Bottom Back Left
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Right
        ],
        
        // P2 to P3
        [
            [(_box select 0 select 0), (_box select 1 select 1), (_box select 1 select 2)], // Top Back Left
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 1 select 2)] // Top Back Right
        ],
        
        // P3 to P4
        [
            [(_box select 1 select 0), (_box select 1 select 1), (_box select 1 select 2)], // Top Back Right
            [(_box select 1 select 0), (_box select 0 select 1), (_box select 1 select 2)] // Bottom Back Right
        ]
    ]
];