/*
 * Author: Kingsley
 * Handles the onLoad event of the map control
 *
 * Arguments:
 * See UI EH
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
params [["_display", displayNull, [displayNull]]];

private _ctrlBtnOk = _display displayCtrl IDC_EDITATTRIBUTES_CTRLMAP_BTN_OK;
private _ctrlBtnCancel = _display displayCtrl IDC_EDITATTRIBUTES_CTRLMAP_BTN_CANCEL;
private _ctrlMap = _display displayCtrl IDC_EDITATTRIBUTES_CTRLMAP_MAP;
private _ctrlReceiver = uiNamespace getVariable [QGVAR(activeMapControlReceiver), controlNull];

private _startWorldPos = _ctrlReceiver getVariable [QGVAR(execReturnData), (getPosATL player)];

_ctrlMap ctrlMapAnimAdd [0, 0.25, _startWorldPos];
ctrlMapAnimCommit _ctrlMap;

_ctrlMap setVariable [QGVAR(receiver), _ctrlReceiver];

_ctrlMap ctrlAddEventHandler ["MouseMoving", {
    params [
        ["_ctrlMap", controlNull, [controlNull]],
        ["_xPos", -1, [0]],
        ["_yPos", -1, [0]],
        ["_mouseIn", false, [true]]
    ];
    
    private _rightButton = _ctrlMap getVariable [QGVAR(rightButton), false];
    
    if (!_rightButton) then {
        if (_mouseIn) then {
            _ctrlMap ctrlMapCursor ["", "Track"];
        } else {
            _ctrlMap ctrlMapCursor ["", "Arrow"];
        };
    };
}];

_ctrlMap ctrlAddEventHandler ["MouseButtonDown", {
    params ["_control", "_button", "_screenPosX", "_screenPosY"];

    private _screenPos = [_screenPosX, _screenPosY];
    private _idc = ctrlIDC _control;
    private _worldPos = _control ctrlMapScreenToWorld _screenPos;
    private _returnPos = _worldPos;
    private _ctrlReceiver = _control getVariable [QGVAR(receiver), controlNull];
    
    if (count _returnPos != 3) then {
        _returnPos pushBack 0;
    };

    if (_button == 0) then {
        _marker = format ["mars_attributes_ctrlMapMarker_%1", _idc];
        deleteMarkerLocal _marker;

        _marker = createMarkerLocal [_marker, _worldPos];
        _marker setMarkerTypeLocal "mil_destroy_noShadow";
        _marker setMarkerColorLocal "ColorYellow";
        _marker setMarkerSizeLocal [1,1];
        _marker setMarkerAlphaLocal 1;
        _marker setMarkerDir 45;
        
        _startPos = _ctrlReceiver getVariable [QGVAR(execReturnData), (getPosATL player)];
        _ctrlReceiver setVariable [QGVAR(execExpression), !(_startPos isEqualTo _worldPos)];
        _ctrlReceiver setVariable [QGVAR(execReturnData), _returnPos];
        
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
    _marker = format ["mars_attributes_ctrlMapMarker_%1", _idc];
    deleteMarkerLocal _marker;
}];

_ctrlBtnOk ctrlAddEventHandler ["MouseButtonClick", {
    closeDialog 0;
    uiNamespace setVariable [QGVAR(activeMapControlReceiver), controlNull];
}];

_ctrlBtnCancel ctrlAddEventHandler ["MouseButtonClick", {
    closeDialog 0;
    uiNamespace setVariable [QGVAR(activeMapControlReceiver), controlNull];
}];
