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
GVAR(capturedEntities) = _entities;

private _getControlByKey = {
    params ["_object", "_key"];
    private _fullKey = format ["%1_%2_idc", QADDON, _key];
    private _idc = _object getVariable [_fullKey, -1];
    if (_idc == -1) exitWith {controlNull};
    ((GETUVAR(GVAR(interface), displayNull) displayCtrl IDC_MOUSEHANDLER_ENTITYICONS) controlsGroupCtrl _idc)
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

        private _object = _ctrl getVariable [QGVAR(object), objNull];

        if !(!(GVAR(selection) isEqualTo []) && _button == 1) then {
            private _group = _ctrl getVariable [QGVAR(group), grpNull];
            private _units = [_object];

            if (!isNull _group) then {
                _units append units _group;
            };

            [_units] call FUNC(selectObject);
        };

        GVAR(objectUnderCursor) = _object;
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
    private _isPerson = (typeOf _object) call CBA_fnc_isPerson;
    private _existingControls = GETUVAR(GVAR(iconControls), []);

    _object setVariable [QGVAR(color), _color];

    if (_isPerson) then {
        // Is person
        if (vehicle _object == _object && {_side != sideLogic} && {leader _object == _object} && {{!isNull _x && {alive _x}} count units group _object > 0}) then {
            // Create group control
            private _grpIcon = [[group _object] call CFUNC(getMarkerType)] call CFUNC(getMarkerTexture);
            private _grpCtrl = [_object, "unit_group"] call _getControlByKey;
            if (isNull _grpCtrl) then {
                GVAR(idcsIcons) = GVAR(idcsIcons) + 1;
                _grpCtrl = _display ctrlCreate ["MARS_gui_ctrlGroupButton", GVAR(idcsIcons), (_display displayCtrl IDC_MOUSEHANDLER_ENTITYICONS)];
                [_object, "unit_group", GVAR(idcsIcons)] call _setObjectControlKey;
                [_grpCtrl] call _addEventHandlers;
                _existingControls pushBack _grpCtrl;
                SETUVAR(GVAR(iconControls), _existingControls);
                _grpCtrl ctrlSetPosition [0, 0, DIM_GROUP select 0, DIM_GROUP select 1];
                _grpCtrl ctrlCommit 0;
            };

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

            private _ctrlTextLeft = _grpCtrl getVariable [QGVAR(ctrlTextLeft), controlNull];
            if (isNil "_ctrlTextLeft" || {isNull _ctrlTextLeft}) then {
                GVAR(idcsIcons) = GVAR(idcsIcons) + 1;
                _ctrlTextLeft = _display ctrlCreate [
                    (["MARS_gui_ctrlCallsignImage","MARS_gui_ctrlCallsignText"] select (isPlayer leader _object)),
                    GVAR(idcsIcons),
                    (_display displayCtrl IDC_MOUSEHANDLER_ENTITYICONS)
                ];
                _ctrlTextLeft ctrlSetPosition [0, 0, (DIM_UNIT select 0) * ([1,4] select (isPlayer leader _object)), (DIM_UNIT select 1) * 0.75];
                _ctrlTextLeft ctrlCommit 0;
                _grpCtrl setVariable [QGVAR(ctrlTextLeft), _ctrlTextLeft];
            };

            if (isPlayer leader _object) then {
                _ctrlTextLeft setVariable [QGVAR(text), groupId (group _object)];
                _ctrlTextLeft setVariable [QGVAR(color), [0,0,0,1]];
            } else {
                _ctrlTextLeft setVariable [QGVAR(text), [group _object, true] call CFUNC(getGroupStatus)];
                _ctrlTextLeft setVariable [QGVAR(color), [1,1,1,1]];
            };

            private _ctrlTextRight = _grpCtrl getVariable [QGVAR(ctrlTextRight), controlNull];
            if (isNil "_ctrlTextRight" || {isNull _ctrlTextRight}) then {
                GVAR(idcsIcons) = GVAR(idcsIcons) + 1;
                _ctrlTextRight = _display ctrlCreate ["MARS_gui_ctrlCallsignText", GVAR(idcsIcons), (_display displayCtrl IDC_MOUSEHANDLER_ENTITYICONS)];
                _ctrlTextRight ctrlSetPosition [0, 0, DIM_UNIT select 0, DIM_UNIT select 1];
                _ctrlTextRight ctrlCommit 0;
                _grpCtrl setVariable [QGVAR(ctrlTextRight), _ctrlTextRight];
            };
            _ctrlTextRight setVariable [QGVAR(text), count ((units (group _object)) select {alive _x})];
        };

        private _ctrl = [_object, "unit"] call _getControlByKey;
        if (isNull _ctrl) then {
            GVAR(idcsIcons) = GVAR(idcsIcons) + 1;
            _ctrl = _display ctrlCreate ["MARS_gui_ctrlUnitButton", GVAR(idcsIcons), (_display displayCtrl IDC_MOUSEHANDLER_ENTITYICONS)];
            [_object, "unit", GVAR(idcsIcons)] call _setObjectControlKey;
            [_ctrl] call _addEventHandlers;
            _existingControls pushBack _ctrl;
            SETUVAR(GVAR(iconControls), _existingControls);
            _ctrl ctrlSetPosition [0, 0, DIM_UNIT select 0, DIM_UNIT select 1];
            _ctrl ctrlCommit 0;
        };

        private _objectIcon = getText (configfile >> "CfgVehicles" >> (typeOf _object) >> "icon");
        private _objectIconPath = [getText (configFile >> "CfgVehicleIcons" >> _objectIcon), _objectIcon] select ((toLower _objectIcon) find "\" > -1);

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
            GVAR(idcsIcons) = GVAR(idcsIcons) + 1;
            _ctrl = _display ctrlCreate ["MARS_gui_ctrlUnitButton", GVAR(idcsIcons), (_display displayCtrl IDC_MOUSEHANDLER_ENTITYICONS)];
            [_object, "vehicle", GVAR(idcsIcons)] call _setObjectControlKey;
            [_ctrl] call _addEventHandlers;
            _existingControls pushBack _ctrl;
            SETUVAR(GVAR(iconControls), _existingControls);
            _ctrl ctrlSetPosition [0, 0, DIM_UNIT select 0, DIM_UNIT select 1];
            _ctrl ctrlCommit 0;
        };

        private _vehicleIcon = getText (configfile >> "CfgVehicles" >> (typeOf _object) >> "icon");
        private _vehicleIconPath = [getText (configFile >> "CfgVehicleIcons" >> _vehicleIcon), _vehicleIcon] select ((toLower _vehicleIcon) find "\" > -1);
        private _vehicleGrpCtrl = [_object, "vehicle_group"] call _getControlByKey;

        _ctrl setVariable [QGVAR(key), "vehicle"];
        _ctrl setVariable [QGVAR(object), _object];
        _ctrl setVariable [QGVAR(texture), _vehicleIconPath];
        _ctrl setVariable [QGVAR(dimensions), DIM_UNIT];
        _ctrl setVariable [QGVAR(color), _color];
        _ctrl setVariable [QGVAR(distance), UNIT_DISTANCE_COEF];
        _ctrl setVariable [QGVAR(isVehicle), true];

        if (_side != sideLogic && {!(crew _object isEqualTo [])} && {{!isNull _x && {alive _x}} count crew _object > 0}) then {
            private _vehicleGrpIcon = [[group _object] call CFUNC(getMarkerType)] call CFUNC(getMarkerTexture);
            private _vehicleGrpDimensions = [CTRLSIZE_GROUP * GRID_W, CTRLSIZE_GROUP * GRID_H];

            if (isNull _vehicleGrpCtrl) then {
                GVAR(idcsIcons) = GVAR(idcsIcons) + 1;
                _vehicleGrpCtrl = _display ctrlCreate ["MARS_gui_ctrlGroupButton", GVAR(idcsIcons), (_display displayCtrl IDC_MOUSEHANDLER_ENTITYICONS)];
                [_object, "vehicle_group", GVAR(idcsIcons)] call _setObjectControlKey;
                [_vehicleGrpCtrl] call _addEventHandlers;
                _existingControls pushBack _vehicleGrpCtrl;
                SETUVAR(GVAR(iconControls), _existingControls);
                _vehicleGrpCtrl ctrlSetPosition [0, 0, _vehicleGrpDimensions select 0, _vehicleGrpDimensions select 1];
                _vehicleGrpCtrl ctrlCommit 0;
            };

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

    false
} count _entities;

END_COUNTER(serializeIcons);
