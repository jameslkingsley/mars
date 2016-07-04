#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Time handling
MARS_time = diag_tickTime;
MARS_realTime = diag_tickTime;
MARS_virtualTime = diag_tickTime;
MARS_diagTime = diag_tickTime;
MARS_gameTime = time;
MARS_pausedTime = 0;
MARS_virtualPausedTime = 0;

[FUNC(timePFH), 0, []] call CBA_fnc_addPerFrameHandler;

GVAR(virtualGroups) = [];

ADDON = true;