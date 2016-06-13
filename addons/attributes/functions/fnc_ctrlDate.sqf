/*
 * Author: Kingsley
 * Creates a date control (year, month, day)
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlDate;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_config", "", [""]],
    ["_idc", -1, [0]],
    ["_group", -1, [0]],
    ["_position", [0,0,0,0], [[]]]
];

_config = call compile _config;
_display = GETUVAR(GVAR(interface),displayNull);

_controlGroup = _display displayCtrl _group;
_ctrlCommonWidth = (_position select 2) / 3;

_ctrlYear = _display ctrlCreate ["MARS_gui_ctrlCombo", _idc, _controlGroup];
_ctrlMonth = _display ctrlCreate ["MARS_gui_ctrlCombo", _idc + 1, _controlGroup];
_ctrlDay = _display ctrlCreate ["MARS_gui_ctrlCombo", _idc + 2, _controlGroup];

{
    _x ctrlSetPosition [
        (_position select 0) + (_forEachIndex * _ctrlCommonWidth),
        (_position select 1),
        _ctrlCommonWidth,
        (_position select 3)
    ];
} forEach [_ctrlYear, _ctrlMonth, _ctrlDay];

_cfgYear = [getNumber (_config >> "year"), call compile getText (_config >> "year")] select (isText (_config >> "year"));
_cfgMonth = [getNumber (_config >> "month"), call compile getText (_config >> "month")] select (isText (_config >> "month"));
_cfgDay = [getNumber (_config >> "day"), call compile getText (_config >> "day")] select (isText (_config >> "day"));

for "_y" from 1900 to 2050 do {
    _yIndex = _ctrlYear lbAdd str _y;
    _ctrlYear lbSetData [_yIndex, str _y];
    _ctrlYear lbSetValue [_yIndex, _y];
    if (_y == _cfgYear) then {_ctrlYear lbSetCurSel _yIndex};
};

_ctrlYear lbAdd "";

for "_m" from 1 to 12 do {
    _mStr = ["January","Febuary","March","April","May","June","July","August","September","October","November","December"] select (_m - 1);
    _mIndex = _ctrlMonth lbAdd _mStr;
    _ctrlMonth lbSetData [_mIndex, str _m];
    _ctrlMonth lbSetValue [_mIndex, _m];
    if (_m == _cfgMonth) then {_ctrlMonth lbSetCurSel _mIndex};
};

_ctrlMonth lbAdd "";

for "_d" from 1 to 31 do {
    _dIndex = _ctrlDay lbAdd str _d;
    _ctrlDay lbSetData [_dIndex, str _d];
    _ctrlDay lbSetValue [_dIndex, _d];
    if (_d == _cfgDay) then {_ctrlDay lbSetCurSel _dIndex};
};

_yearHandle = {
    params ["_ctrlYearIDC","_ctrlMonthIDC","_ctrlDayIDC"];

    _display = GETUVAR(GVAR(interface),displayNull);

    _ctrlYear = _display displayCtrl _ctrlYearIDC;
    _ctrlMonth = _display displayCtrl _ctrlMonthIDC;
    _ctrlDay = _display displayCtrl _ctrlDayIDC;

    _year = _ctrlYear lbValue (lbCurSel _ctrlYear);
    _month = _ctrlMonth lbValue (lbCurSel _ctrlMonth);
    _isLeapYear = false;

    _days = switch (_month) do {
        case 1: {31};
        case 2: {
            if ((_year % 4 == 0 && _year % 100 != 0) || (_year % 400 == 0)) then {_isLeapYear = true; 29} else {28};
        };
        case 3: {31};
        case 4: {30};
        case 5: {31};
        case 6: {30};
        case 7: {31};
        case 8: {31};
        case 9: {30};
        case 10: {31};
        case 11: {30};
        case 12: {31};
        default {0};
    };
    
    if (_days == 0) exitwith {};

    _yearID = _year % 100;
    _monthID = [if (_isLeapYear) then {6} else {0}, if (_isLeapYear) then {2} else {3}, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5] select (_month - 1);
    _centuryID = [6, 4, 2, 0] select (((_year - _yearID) / 100) % 4);
    _dayID = 1;
    _weekDay = floor (_dayID + _monthID + _yearID + _yearID / 4 + _centuryID) % 7;
    _dayNames = [
        'str_sunday',
        'str_monday',
        'str_tuesday',
        'str_wednesday',
        'str_thursday',
        'str_friday',
        'str_saturday'
    ];

    _curSel = lbCurSel _ctrlDay;
    lbClear _ctrlDay;
    _dPicture = -100;
    
    for "_d" from 1 to _days do {
        _weekDayID = round ((_weekDay + _d - 1) % 7);
        _lbAdd = _ctrlDay lbAdd str _d;
        _ctrlDay lbSetValue [_lbAdd, _d];
        _ctrlDay lbSetTextRight [_lbAdd, localize (_dayNames select _weekDayID)];
        _pictureRight = '#(argb,8,8,3)color(0,0,0,0)';
        if !(_weekDayID in [0,6]) then {_ctrlDay lbSetColorRight [_lbAdd, [1,1,1,0.25]]};
        
        _moonPhase = moonPhase [_year, _month, _d, 0, 0];
        _pictureRight = "";
        if ((_d - _dPicture) > 5 && _moonPhase > 0.964) then {_pictureRight = QPATHTOF(data\Controls\Date\moon_full_ca.paa); _dPicture = _d;};
        if ((_d - _dPicture) > 5 && _moonPhase < 0.036) then {_pictureRight = QPATHTOF(data\Controls\Date\moon_new_ca.paa); _dPicture = _d;};
        _ctrlDay lbSetPictureRight [_lbAdd, _pictureRight];
    };
    
    _ctrlDay lbAdd "";
    _ctrlDay lbSetCurSel (_curSel min (lbSize _ctrlDay - 1));
};

[ctrlIDC _ctrlYear, ctrlIDC _ctrlMonth, ctrlIDC _ctrlDay] call _yearHandle;

_ctrlYear ctrlAddEventHandler ["LBSelChanged", format ["[%1,%2,%3] call %4", ctrlIDC _ctrlYear, ctrlIDC _ctrlMonth, ctrlIDC _ctrlDay, _yearHandle]];
_ctrlMonth ctrlAddEventHandler ["LBSelChanged", format ["[%1,%2,%3] call %4", ctrlIDC _ctrlYear, ctrlIDC _ctrlMonth, ctrlIDC _ctrlDay, _yearHandle]];

{
    _x setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
    _x setVariable [QGVAR(comboStartIndex), (lbCurSel _x)];
    _x setVariable [QGVAR(execExpression), false];
    _x setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
    _x setVariable [QGVAR(execReturnData), (_x lbValue (lbCurSel _x))];
    
    _x ctrlAddEventHandler ["LBSelChanged", {
        params ["_ctrl","_index"];
        _startIndex = _ctrl getVariable [QGVAR(comboStartIndex), -1];
        _ctrl setVariable [QGVAR(execExpression), (_index != _startIndex)];
        _ctrl setVariable [QGVAR(execReturnData), (_ctrl lbValue (lbCurSel _ctrl))];
    }];
} forEach [_ctrlYear, _ctrlMonth, _ctrlDay];

{
    _x params ["_configEvent","_runtimeEvent"];
    if (!isNull (_config >> _configEvent)) then {
        {_x ctrlAddEventHandler [_runtimeEvent, getText (_config >> _configEvent)]} forEach [_ctrlYear, _ctrlMonth, _ctrlDay];
    };
} forEach [
    ["onLBSelChanged", "LBSelChanged"]
];

{_x ctrlCommit 0} forEach [_ctrlYear, _ctrlMonth, _ctrlDay];

[_ctrlYear, _ctrlMonth, _ctrlDay]