/*
 * Author: Kingsley
 * Creates a map control
 *
 * Arguments:
 * 0: Control config <STRING>
 * 1: IDC <NUMBER>
 * 2: Group IDC <NUMBER>
 * 3: Position <ARRAY>
 *
 * Return Value:
 * Created control <CONTROL>
 *
 * Example:
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlMap;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_config", "", [""]],
    ["_idc", -1, [0]],
    ["_group", -1, [0]],
    ["_position", [0,0,0,0], [[]]],
    ["_labelIDC", -1, [0]]
];

_config = call compile _config;
_display = GETUVAR(GVAR(interface),displayNull);

_controlGroup = _display displayCtrl _group;
_controlGroupPos = ctrlPosition _controlGroup;

_ctrlMap = _display ctrlCreate ["MARS_gui_ctrlMap", _idc];

_position set [0, (_position select 0) + (_controlGroupPos select 0)];
_position set [1, (_position select 1) + (_controlGroupPos select 1)];
_position set [3, (_position select 2)];
_ctrlMap ctrlSetPosition _position;
_ctrlMap ctrlCommit 0;

_startPosition = [call compile getText (_config >> "position"), getArray (_config >> "position")] select (isArray (_config >> "position"));

if (_startPosition isEqualType objNull) then {
    _startPosition = getPosATL _startPosition;
};

if (count _startPosition != 3) then {
    _startPosition pushBack 0;
};

_ctrlMap ctrlMapAnimAdd [0, 0.25, _startPosition];
ctrlMapAnimCommit _ctrlMap;

_ctrlMap setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
_ctrlMap setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlMap setVariable [QGVAR(mapStartPos), _startPosition];
_ctrlMap setVariable [QGVAR(execExpression), false];
_ctrlMap setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
_ctrlMap setVariable [QGVAR(execReturnData), _startPosition];

_ctrlMap ctrlAddEventHandler ["MouseMoving", {
    params [
        ["_mapCtrl", controlNull, [controlNull]],
        ["_xPos", -1, [0]],
        ["_yPos", -1, [0]],
        ["_mouseIn", false, [true]]
    ];
    
    private _rightButton = _mapCtrl getVariable [QGVAR(rightButton), false];
    
    if (!_rightButton) then {
        if (_mouseIn) then {
            _mapCtrl ctrlMapCursor ["", "Track"];
        } else {
            _mapCtrl ctrlMapCursor ["", "Arrow"];
        };
    };
}];

_ctrlMap ctrlAddEventHandler ["MouseButtonDown", {
    params ["_control", "_button", "_screenPosX", "_screenPosY"];

    private _screenPos = [_screenPosX, _screenPosY];
    private _idc = ctrlIDC _control;
    private _worldPos = _control ctrlMapScreenToWorld _screenPos;
    private _returnPos = _worldPos;
    
    if (count _returnPos != 3) then {
        _returnPos pushBack 0;
    };

    if (_button == 0) then {
        _marker = format ["ctrlMapMarker_%1", _idc];
        deleteMarkerLocal _marker;

        _marker = createMarkerLocal [_marker, _worldPos];
        _marker setMarkerTypeLocal "mil_destroy_noShadow";
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerSizeLocal [1,1];
        _marker setMarkerAlphaLocal 1;
        _marker setMarkerDir 45;

        _startPos = _control getVariable [QGVAR(mapStartPos), []];
        _control setVariable [QGVAR(execExpression), !(_startPos isEqualTo _worldPos)];
        _control setVariable [QGVAR(execReturnData), _returnPos];
        
        _control setVariable [QGVAR(leftButton), true];
        _control setVariable [QGVAR(rightButton), false];
        
        _control ctrlMapCursor ["", "Track"];
    } else {
        _control ctrlMapCursor ["", "Move"];
        _control setVariable [QGVAR(leftButton), false];
        _control setVariable [QGVAR(rightButton), true];
    };
}];

_ctrlMap ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control", "_button", "_screenPosX", "_screenPosY"];
    
    _control ctrlMapCursor ["", "Track"];
    _control setVariable [QGVAR(leftButton), false];
    _control setVariable [QGVAR(rightButton), false];
}];

_ctrlMap ctrlAddEventHandler ["Destroy", {
    params ["_control"];
    private _idc = ctrlIDC _control;
    _marker = format ["ctrlMapMarker_%1", _idc];
    deleteMarkerLocal _marker;
}];

_ctrlMap ctrlCommit 0;

_ctrlMap