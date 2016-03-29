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
        _alpha = if ((leader _grp) in GVAR(selection)) then {1} else {(linearConversion [0, ICON_FADE_DISTANCE, (_leaderPos distance GVAR(camPos)), 1, 0, true])};
        
        if (alive (leader _grp)) then {
            _iconPos = [(_leaderPos select 0), (_leaderPos select 1), (_leaderPos select 2) + 5];
            _color = MARS_SIDECOLOR(side _grp);
            _color set [3, (_alpha max 0.2)];
            
            drawIcon3D [
                ([([_grp] call EFUNC(common,getMarkerType))] call EFUNC(common,getMarkerTexture)),
                _color,
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
                [0,0,0,_alpha]
            ];
        };
        
        {
            _unit = _x;
            _unitPos = ASLtoAGL (getPosASLVisual _unit);
            _alpha = if (_unit in GVAR(selection)) then {1} else {(linearConversion [0, BOX_FADE_DISTANCE, (_unitPos distance GVAR(camPos)), 1, 0, true])};
            _color = MARS_SIDECOLOR(side _unit);
            _color set [3, _alpha];
            _iconStr = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "icon");
            _iconTexture = getText (configfile >> "CfgVehicleIcons" >> _iconStr);
            
            if (vehicle _unit != _unit) then {
                // In vehicle
                if ((driver (vehicle _unit)) != _unit) exitWith {false};
            };
            
            if (isPlayer _unit) then {
                _selColor = [0,0,0,_alpha];
                if (alive _unit) then {
                    if (local _unit) then {
                        _selColor = [1,0,0,_alpha];
                    } else {
                        _selColor = [1,0,0.5,_alpha];
                    };
                } else {
                    _selColor = [0,0,0,_alpha];
                };
                
                drawIcon3D [
                    "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
                    _selColor,
                    _unitPos,
                    1,
                    1,
                    0,
                    "",
                    1,
                    0
                ];
            };
            
            if (alive _unit) then {
                drawIcon3D [
                    _iconTexture,
                    _color,
                    _unitPos,
                    1,
                    1,
                    0,
                    "",
                    1,
                    0
                ];
                
                drawLine3D [
                    [(_unitPos select 0), (_unitPos select 1), (_unitPos select 2) + 1],
                    [(_leaderPos select 0), (_leaderPos select 1), (_leaderPos select 2) + 1],
                    _color
                ];
            };
            
            false
        } count (units _x);
    };
    
    false
} count allGroups;