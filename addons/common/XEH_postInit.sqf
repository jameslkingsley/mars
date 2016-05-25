#include "script_component.hpp"

// Single PFEH to handle execNextFrame, waitAndExec and waitUntilAndExec
[{
    // Handle the waitAndExec array
    while {!(GVAR(waitAndExecArray) isEqualTo []) && {GVAR(waitAndExecArray) select 0 select 0 <= MARS_time}} do {
        private _entry = GVAR(waitAndExecArray) deleteAt 0;
        (_entry select 2) call (_entry select 1);
    };

    // Handle the execNextFrame array
    {
        (_x select 0) call (_x select 1);
        false
    } count GVAR(nextFrameBufferA);

    // Swap double-buffer
    GVAR(nextFrameBufferA) = GVAR(nextFrameBufferB);
    GVAR(nextFrameBufferB) = [];
    GVAR(nextFrameNo) = diag_frameNo + 1;

    // Handle the waitUntilAndExec array
    {
        // if condition is satisifed call statement
        if ((_x select 2) call (_x select 0)) then {
            // make sure to delete the correct handle when multiple conditions are met in one frame
            GVAR(waitUntilAndExecArray) deleteAt (GVAR(waitUntilAndExecArray) find _x);
            (_x select 2) call (_x select 1);
        };
        nil
    } count + GVAR(waitUntilAndExecArray);
}, 0, []] call CBA_fnc_addPerFrameHandler;
