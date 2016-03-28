/*
 * Author: Kingsley
 * Handles object icons in 3D space
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

{
    _grp = _x;
    _leaderPos = (leader _grp) modelToWorld (boundingCenter (leader _grp));
    _iconPos = [(_leaderPos select 0), (_leaderPos select 1), (_leaderPos select 2) + 5];
    
    drawIcon3D [
        "\A3\ui_f\data\map\markers\nato\n_unknown.paa",
        ([side _grp] call BIS_fnc_sideColor),
        _iconPos,
        1,
        1,
        0,
        "",
        0,
        0
    ];
    
    drawLine3D [
        _leaderPos,
        _iconPos,
        ([side _grp] call BIS_fnc_sideColor)
    ];
    
    {
        _unit = _x;
        _side = side _unit;
        
        
        
        GVAR(cachedUnits) pushBack _unit;
    } forEach (units _x) - GVAR(cachedUnits);
} forEach allGroups;