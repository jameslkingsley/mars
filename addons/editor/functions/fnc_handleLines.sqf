/*
 * Author: Kingsley
 * Handles object lines in 3D space
 * This function is called on every frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_handleLines;
 *
 * Public: No
 */

#include "script_component.hpp"

// BEGIN_COUNTER(lineHandler);

if (GVAR(mapOpen)) exitWith {};

_camPosASL = GVAR(camPos);

{
    _x params ["_object1", "_object2", "_color", ["_zOffset1", 0], ["_zOffset2", 0], ["_isPerson", false]];
    
    if (_isPerson) then {
        _zOffset1 = (_object1 selectionPosition "pelvis") param [2, _zOffset1];
    };

    _startPos = (getPosASLVisual _object1) vectorAdd [0, 0, _zOffset1];
    _endPos = (getPosASLVisual _object2) vectorAdd [0, 0, _zOffset2];
    _alpha = linearConversion [0, GVAR(iconDrawDistance), (_startPos distance _camPosASL), 1, 0, true];
    _color set [3, _alpha];

    drawLine3D [
        ASLtoAGL _startPos,
        ASLtoAGL _endPos,
        _color
    ];

    false
} count (GVAR(serializedLines) select {
    private _obj1 = _x param [0, objNull];
    private _isPerson = _x param [5, false];

    (
        !isNull _obj1 &&
        {(
            !(vehicle _obj1 isKindOf "CAManBase") ||
            {leader _obj1 == _obj1} ||
            {{_x in GVAR(selection)} count (units group _obj1) > 0}
        )}
    )
});

// END_COUNTER(lineHandler);
