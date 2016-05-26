/*
 * Author: Kingsley
 * Handles the entity list tree view
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

disableSerialization;

_ctrl = GETUVAR(GVAR(interface),displayNull) displayCtrl IDC_ENTITYLIST;

{
    _group = _x;
    _grpPath = -1;

    _parentSide = [
        GVAR(entityList_empty),
        GVAR(entityList_west),
        GVAR(entityList_east),
        GVAR(entityList_guer),
        GVAR(entityList_civ)
    ] select (([west, east, resistance, civilian] find (side _group)) + 1);

    if !(_group in GVAR(entityListGroups)) then {
        _grpPath = _ctrl tvAdd [[_parentSide], groupID _group];
        GVAR(entityListGroups) pushBack _group;
    } else {
        _grpPath = GETVAR(_group,GVAR(entityListGroupPath),-1);

        if (_grpPath < 0) then {
            _grpPath = _ctrl tvAdd [[_parentSide], groupID _group];
            SETVAR(_group,GVAR(entityListGroupPath),_grpPath);
        };
    };

    {
        _unit = _x;

        if !(_unit in GVAR(entityListUnits)) then {
            _unitPath = _ctrl tvAdd [[[GVAR(entityList_empty), _parentSide] select (alive _unit), _grpPath], name _unit];

            GVAR(entityListUnits) pushBack _unit;
        } else {
            _unitPath = GVAR(_unitPath,GVAR(entityListUnitPath),-1);

            if (_unitPath < 0) then {
                _unitPath = _ctrl tvAdd [[_parentSide,_grpPath], name _unit];
                SETVAR(_unit,GVAR(entityListUnitPath),_unitPath);
            };
        };

        false
    } count (units _group);

    false
} count allGroups - GVAR(entityListGroups);
