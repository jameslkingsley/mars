/*
 * Author: ACE
 * Dumps performance counter statistics into Logs.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

diag_log text format ["REGISTERED ACE PFH HANDLERS"];
diag_log text format ["-------------------------------------------"];

if (!isNil "ACE_PFH_COUNTER") then {
    {
        _x params ["_pfh", "_parameters"];

        private _isActive = ["ACTIVE", "REMOVED"] select isNil {CBA_common_PFHhandles select (_pfh select 0)};

        diag_log text format ["Registered PFH: id=%1 [%2, delay %3], %4:%5", _pfh select 0, _isActive, _parameters select 1, _pfh select 1, _pfh select 2];
        false
    } count ACE_PFH_COUNTER;
};

diag_log text format ["ACE COUNTER RESULTS"];
diag_log text format ["-------------------------------------------"];

{
    private _counterEntry = _x;
    private _iter = 0;
    private _total = 0;
    private _count = 0;
    private _averageResult = 0;

    if (count _counterEntry > 3) then {
        {
            if (_iter > 2) then {
                _count = _count + 1;
                private _delta = (_x select 1) - (_x select 0);

                _total = _total + _delta;
            };

            _iter = _iter + 1;
            false
        } count _counterEntry;

        _averageResult = (_total / _count) * 1000;

        diag_log text format ["%1: Average: %2s / %3 = %4ms", _counterEntry select 0, _total, _count, _averageResult];
    } else {
        diag_log text format ["%1: No results", _counterEntry select 0];
    };
    false
} count ACE_COUNTERS;
