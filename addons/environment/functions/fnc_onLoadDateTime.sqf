/*
 * Author: Kingsley
 * Handles onLoad event of date/time GUI
 *
 * Arguments:
 * See EH
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

params [["_display", displayNull]];

if (isNull _display) exitWith {};

_year = _display displayCtrl 2100;
_month = _display displayCtrl 2101;
_day = _display displayCtrl 2102;
_time = _display displayCtrl 1900;

_now = date;

for "_i" from 1982 to 2050 do {
    _index = _year lbAdd (str _i);
    _year lbSetData [_index, str _i];
    if (_i == (_now select 0)) then {_year lbSetCurSel _index};
};

for "_i" from 1 to 12 do {
    _monthStr = switch (_i) do {
        case 1: {"January"};
        case 2: {"Febuary"};
        case 3: {"March"};
        case 4: {"April"};
        case 5: {"May"};
        case 6: {"June"};
        case 7: {"July"};
        case 8: {"August"};
        case 9: {"September"};
        case 10: {"October"};
        case 11: {"November"};
        case 12: {"December"};
    };

    _index = _month lbAdd _monthStr;
    _month lbSetData [_index, str _i];
    if (_i == (_now select 1)) then {_month lbSetCurSel _index};
};

for "_i" from 1 to 31 do {
    _index = _day lbAdd (str _i);
    _day lbSetData [_index, str _i];
    if (_i == (_now select 2)) then {_day lbSetCurSel _index};
};

_time sliderSetRange [0, 86400];
_time sliderSetSpeed [3600, 3600];

_time ctrlAddEventHandler ["SliderPosChanged", {
    params ["_control","_change"];
    _timePos = sliderPosition _control;
    _timeHour = round ((_timePos / 60) / 60);
    _timeMinsScale = ((_timePos / 60) / 60) - _timeHour;
    _timeMins = linearConversion [0, 1, _timeMinsScale, 0, 59, true];
    _timeStr = format ["%1:%2", _timeHour, _timeMins];
    _control ctrlSetTooltip _timeStr;
}];
