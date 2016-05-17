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
        _leader = leader _grp;
        _leaderPos = ASLtoAGL (getPosASLVisual _leader);
        _leaderDistance = _leaderPos distance GVAR(camPos);
        
        if (alive _leader && _leaderDistance < ICON_FADE_DISTANCE) then {
            _alpha = [(linearConversion [0, ICON_FADE_DISTANCE, _leaderDistance, 1, 0, true]), 1] select (_leader in GVAR(selection));
            _color = MARS_SIDECOLOR(side _grp);
            _color set [3, (_alpha max 0.2)];
            
            _texture = _grp getVariable [QGVAR(iconTexture), ""];
            if (_texture == "") then {
                _texture = [([_grp] call EFUNC(common,getMarkerType))] call EFUNC(common,getMarkerTexture);
                _grp setVariable [QGVAR(iconTexture), _texture];
            };
            
            drawIcon3D [
                _texture,
                _color,
                [(_leaderPos select 0), (_leaderPos select 1), (_leaderPos select 2) + 5],
                1,
                1,
                0,
                "",
                0,
                0
            ];
            
            drawLine3D [
                _leaderPos,
                [(_leaderPos select 0), (_leaderPos select 1), (_leaderPos select 2) + 5],
                [0,0,0,_alpha]
            ];
        };
        
        {
            _unit = _x;
            if (!alive _unit) exitWith {};
            _unitPos = ASLtoAGL (getPosASLVisual _unit);
            _unitDistance = _unitPos distance GVAR(camPos);
            if (_unitDistance > ICON_FADE_DISTANCE) exitWith {};
            _alpha = [(linearConversion [0, BOX_FADE_DISTANCE, _unitDistance, 1, 0, true]), 1] select (_unit in GVAR(selection));
            _color = MARS_SIDECOLOR(side group _unit);
            _color set [3, _alpha];
            
            _iconTexture = _unit getVariable [QGVAR(iconTexture), ""];
            if (_iconTexture == "") then {
                _iconTexture = getText (configfile >> "CfgVehicleIcons" >> (getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "icon")));
                _unit setVariable [QGVAR(iconTexture), _iconTexture];
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