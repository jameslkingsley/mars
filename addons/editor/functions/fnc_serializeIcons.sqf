/*
 * Author: Kingsley
 * Serializes object icons into controls
 * Runs in scheduled environment
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Objects to process (optional) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call mars_editor_fnc_serializeIcons;
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\z\mars\addons\common\macros.hpp"

#define CTRLSIZE_ICON 5
#define CTRLSIZE_GROUP 6.66
#define DIM_UNIT ([CTRLSIZE_ICON * GRID_W, CTRLSIZE_ICON * GRID_H])
#define DIM_GROUP ([CTRLSIZE_GROUP * GRID_W, CTRLSIZE_GROUP * GRID_H])

#define UNIT_DISTANCE_COEF 0.15
#define GROUP_DISTANCE_COEF 1

BEGIN_COUNTER(serializeIcons);

disableSerialization;

params [
    ["_display", displayNull, [displayNull]],
    ["_entities", [], [[]]]
];

if (_entities isEqualTo []) then {
    _entities = ((((entities "All") select {
        !((worldToScreen (getPos _x)) isEqualTo []) &&
        {_x distance GVAR(camera) <= GVAR(iconDrawDistance)} &&
        {!(side group _x in [sideAmbientLife, sideLogic])} &&
        {!(typeOf _x in ["GroundWeaponHolder","WeaponHolderSimulated"])}
    }) + (allMissionObjects "Static")) - (entities "Animal"));
};

_entities = _entities arrayIntersect _entities;

private _getControlByKey = {
    params ["_object", "_key"];
    private _fullKey = format ["%1_%2_idc", QADDON, _key];
    private _idc = _object getVariable [_fullKey, -1];
    if (_idc == -1) exitWith {controlNull};
    ((GETUVAR(GVAR(interface), displayNull) displayCtrl IDC_MOUSEHANDLER) controlsGroupCtrl _idc)
};

private _setObjectControlKey = {
    params ["_object", "_key", "_idc"];
    private _fullKey = format ["%1_%2_idc", QADDON, _key];
    _object setVariable [_fullKey, _idc];
};

private _addEventHandlers = {
    params ["_ctrl"];

    _ctrl ctrlAddEventHandler ["MouseEnter", {
        params ["_ctrl"];

        private _group = _ctrl getVariable [QGVAR(group), grpNull];
        GVAR(hoveringOverGroupIcon) = !(isNull _group);

        ["select"] call FUNC(setCursor);
        GVAR(hoveringOverIcon) = true;

        private _bbPFH = _ctrl getVariable [QGVAR(bbPFH), -1];
        [_bbPFH] call CBA_fnc_removePerFrameHandler;

        if (GVAR(bbOpen)) then {
            _bbPFH = [{
                params ["_ctrl", "_handle"];

                private _object = _ctrl getVariable [QGVAR(object), objNull];
                private _group = _ctrl getVariable [QGVAR(group), grpNull];
                private _color = _ctrl getVariable [QGVAR(color), [0,0,0,1]];

                if (isNull _group) then {
                    [_object, _color] call FUNC(drawBoundingBox);
                    GVAR(objectUnderCursor) = _object;
                };
            }, 0, _ctrl] call CBA_fnc_addPerFrameHandler;
        };

        _ctrl setVariable [QGVAR(bbPFH), _bbPFH];
        _ctrl setVariable [QGVAR(hovered), true];
    }];

    _ctrl ctrlAddEventHandler ["MouseExit", {
        params ["_ctrl"];

        GVAR(hoveringOverIcon) = false;
        GVAR(hoveringOverGroupIcon) = false;
        GVAR(objectUnderCursor) = objNull;

        private _bbPFH = _ctrl getVariable [QGVAR(bbPFH), -1];
        [_bbPFH] call CBA_fnc_removePerFrameHandler;

        _ctrl setVariable [QGVAR(hovered), false];
    }];

    _ctrl ctrlAddEventHandler ["MouseButtonUp", {
        params ["_ctrl", "_button"];

        if (_button == 0) then {
            private _group = _ctrl getVariable [QGVAR(group), grpNull];
            private _units = units _group;
            _units append [_object];
            [_units] call FUNC(selectObject);
        };

        GVAR(objectUnderCursor) = _ctrl getVariable [QGVAR(object), objNull];
        ["onmousebuttonup", _this] call FUNC(handleInterface);
    }];

    _ctrl ctrlAddEventHandler ["MouseButtonDown", {
        params ["_ctrl", "_button"];
        private _isGroup = _ctrl getVariable [QGVAR(isGroup), false];
        GVAR(objectUnderCursor) = _ctrl getVariable [QGVAR(object), objNull];
        if (!_isGroup) then {
            ["onmousebuttondown", _this] call FUNC(handleInterface);
        };
    }];
};

{
    private _object = vehicle _x;
    private _side = side group _object;
    private _color = [_side] call CFUNC(getSideColor);
    private _existingControls = GETUVAR(GVAR(iconControls), []);
    private _idcIndex = (count _existingControls) + 1;
    private _idc = IDC_ICONCONTROL_PREFIX + _idcIndex;
    private _idcGrp = IDC_GRPICONCONTROL_PREFIX + _idcIndex;
    private _isPerson = (typeOf _object) call CBA_fnc_isPerson;

    _object setVariable [QGVAR(color), _color];

    if (_isPerson) then {
        // Is person
        if (_side != sideLogic && {leader _object == _object} && {{!isNull _x && {alive _x}} count units group _object > 0}) then {
            // Create group control
            private _grpIcon = [[group _object] call CFUNC(getMarkerType)] call CFUNC(getMarkerTexture);
            private _grpCtrl = [_object, "unit_group"] call _getControlByKey;
            if (isNull _grpCtrl) then {
                _grpCtrl = _display ctrlCreate ["MARS_gui_ctrlGroupButton", _idcGrp, (_display displayCtrl IDC_MOUSEHANDLER)];
                [_object, "unit_group", _idcGrp] call _setObjectControlKey;
                [_grpCtrl] call _addEventHandlers;
                _existingControls pushBack _grpCtrl;
                SETUVAR(GVAR(iconControls), _existingControls);
            };

            _grpCtrl ctrlSetPosition [0, 0, DIM_GROUP select 0, DIM_GROUP select 1];
            _grpCtrl ctrlCommit 0;

            _grpCtrl setVariable [QGVAR(key), "unit_group"];
            _grpCtrl setVariable [QGVAR(object), _object];
            _grpCtrl setVariable [QGVAR(texture), _grpIcon];
            _grpCtrl setVariable [QGVAR(offset), [0, 0, 10]];
            _grpCtrl setVariable [QGVAR(group), group _object];
            _grpCtrl setVariable [QGVAR(dimensions), DIM_GROUP];
            _grpCtrl setVariable [QGVAR(color), _color];
            _grpCtrl setVariable [QGVAR(lineData), [_object, _object, [0, 0, 10], "pelvis", "", [0,0,0,1]]];
            _grpCtrl setVariable [QGVAR(distance), GROUP_DISTANCE_COEF];
            _grpCtrl setVariable [QGVAR(isGroup), true];
        };

        private _ctrl = [_object, "unit"] call _getControlByKey;
        if (isNull _ctrl) then {
            _ctrl = _display ctrlCreate ["MARS_gui_ctrlUnitButton", _idc, (_display displayCtrl IDC_MOUSEHANDLER)];
            [_object, "unit", _idc] call _setObjectControlKey;
            [_ctrl] call _addEventHandlers;
            _existingControls pushBack _ctrl;
            SETUVAR(GVAR(iconControls), _existingControls);
        };

        private _objectIcon = getText (configfile >> "CfgVehicles" >> (typeOf _object) >> "icon");
        private _objectIconPath = [getText (configFile >> "CfgVehicleIcons" >> _objectIcon), _objectIcon] select ((toLower _objectIcon) find "\" > -1);

        _ctrl ctrlSetPosition [0, 0, DIM_UNIT select 0, DIM_UNIT select 1];
        _ctrl ctrlCommit 0;

        _ctrl setVariable [QGVAR(key), "unit"];
        _ctrl setVariable [QGVAR(object), _object];
        _ctrl setVariable [QGVAR(texture), _objectIconPath];
        _ctrl setVariable [QGVAR(dimensions), DIM_UNIT];
        _ctrl setVariable [QGVAR(color), _color];
        _ctrl setVariable [QGVAR(distance), UNIT_DISTANCE_COEF];

        _ctrl setVariable [QGVAR(lineData), []];
        if (leader _object != _object) then {
            _ctrl setVariable [QGVAR(lineData), [_object, leader _object, [0, 0, 0], "pelvis", "pelvis", _color]];
        };
    } else {
        // Is vehicle
        private _ctrl = [_object, "vehicle"] call _getControlByKey;
        if (isNull _ctrl) then {
            _ctrl = _display ctrlCreate ["MARS_gui_ctrlUnitButton", _idc, (_display displayCtrl IDC_MOUSEHANDLER)];
            [_object, "vehicle", _idc] call _setObjectControlKey;
            [_ctrl] call _addEventHandlers;
            _existingControls pushBack _ctrl;
            SETUVAR(GVAR(iconControls), _existingControls);
        };

        private _vehicleIcon = getText (configfile >> "CfgVehicles" >> (typeOf _object) >> "icon");
        private _vehicleIconPath = [getText (configFile >> "CfgVehicleIcons" >> _vehicleIcon), _vehicleIcon] select ((toLower _vehicleIcon) find "\" > -1);
        private _vehicleGrpCtrl = [_object, "vehicle_group"] call _getControlByKey;

        _ctrl ctrlSetPosition [0, 0, DIM_UNIT select 0, DIM_UNIT select 1];
        _ctrl ctrlCommit 0;

        _ctrl setVariable [QGVAR(key), "vehicle"];
        _ctrl setVariable [QGVAR(object), _object];
        _ctrl setVariable [QGVAR(texture), _vehicleIconPath];
        _ctrl setVariable [QGVAR(dimensions), DIM_UNIT];
        _ctrl setVariable [QGVAR(color), _color];
        _ctrl setVariable [QGVAR(distance), UNIT_DISTANCE_COEF];

        if (_side != sideLogic && {!(crew _object isEqualTo [])} && {{!isNull _x && {alive _x}} count crew _object > 0}) then {
            private _vehicleGrpIcon = [[group _object] call CFUNC(getMarkerType)] call CFUNC(getMarkerTexture);

            if (isNull _vehicleGrpCtrl) then {
                _vehicleGrpCtrl = _display ctrlCreate ["MARS_gui_ctrlGroupButton", _idcGrp, (_display displayCtrl IDC_MOUSEHANDLER)];
                [_object, "vehicle_group", _idcGrp] call _setObjectControlKey;
                [_vehicleGrpCtrl] call _addEventHandlers;
                _existingControls pushBack _vehicleGrpCtrl;
                SETUVAR(GVAR(iconControls), _existingControls);
            };

            private _vehicleGrpDimensions = [CTRLSIZE_GROUP * GRID_W, CTRLSIZE_GROUP * GRID_H];

            _vehicleGrpCtrl ctrlSetPosition [0, 0, _vehicleGrpDimensions select 0, _vehicleGrpDimensions select 1];
            _vehicleGrpCtrl ctrlCommit 0;

            _vehicleGrpCtrl setVariable [QGVAR(key), "vehicle_group"];
            _vehicleGrpCtrl setVariable [QGVAR(object), _object];
            _vehicleGrpCtrl setVariable [QGVAR(texture), _vehicleGrpIcon];
            _vehicleGrpCtrl setVariable [QGVAR(offset), [0, 0, 10]];
            _vehicleGrpCtrl setVariable [QGVAR(group), group _object];
            _vehicleGrpCtrl setVariable [QGVAR(dimensions), _vehicleGrpDimensions];
            _vehicleGrpCtrl setVariable [QGVAR(color), _color];
            _vehicleGrpCtrl setVariable [QGVAR(lineData), [_object, _object, [0, 0, 10], "", "", [0,0,0,1]]];
            _vehicleGrpCtrl setVariable [QGVAR(distance), GROUP_DISTANCE_COEF];
            _vehicleGrpCtrl setVariable [QGVAR(isGroup), true];
        } else {
            if (!isNull _vehicleGrpCtrl) then {
                _vehicleGrpCtrl setVariable [QGVAR(deleteNext), true];
            };
        };
    };

    if (canSuspend) then {
        sleep 0.1;
    };

    false
} count _entities;

END_COUNTER(serializeIcons);
