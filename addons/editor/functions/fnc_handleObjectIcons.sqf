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
    
    if (count (units _grp) > 0) then {
        _leaderPos = ASLtoAGL (getPosASLVisual (leader _grp));
        
        if (alive (leader _grp) && (_leaderPos distance GVAR(camPos)) < 2500) then {
            _iconPos = [(_leaderPos select 0), (_leaderPos select 1), (_leaderPos select 2) + 5];
            
            drawIcon3D [
                ([([_grp] call EFUNC(common,getMarkerType))] call EFUNC(common,getMarkerTexture)),
                MARS_SIDECOLOR(side _grp),
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
                MARS_SIDECOLOR(side _grp)
            ];
        };
        
        {
            _unit = _x;
            _unitPos = ASLtoAGL (getPosASLVisual _unit);
            if (alive _unit && (_unitPos distance GVAR(camPos)) < 500) then {
                drawLine3D [
                    [(_unitPos select 0), (_unitPos select 1), (_unitPos select 2) + 1],
                    [(_leaderPos select 0), (_leaderPos select 1), (_leaderPos select 2) + 1],
                    MARS_SIDECOLOR(side _unit)
                ];
            };
            
            false
        } count (units _x);
    };
    
    false
} count allGroups;