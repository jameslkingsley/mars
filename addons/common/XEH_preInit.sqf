#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// GVARS for execNextFrame and waitAndExec and waitUntilAndExecute
GVAR(waitAndExecArray) = [];
GVAR(nextFrameNo) = diag_frameno;
GVAR(nextFrameBufferA) = [];
GVAR(nextFrameBufferB) = [];
GVAR(waitUntilAndExecArray) = [];

// Time handling
MARS_time = diag_tickTime;
MARS_realTime = diag_tickTime;
MARS_virtualTime = diag_tickTime;
MARS_diagTime = diag_tickTime;
MARS_gameTime = time;
MARS_pausedTime = 0;
MARS_virtualPausedTime = 0;

[FUNC(timePFH), 0, []] call CBA_fnc_addPerFrameHandler;

ADDON = true;