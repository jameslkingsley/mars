/*
 * Author: jaynus
 * PFEH to set all Mars Time Variables
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

private _lastTickTime = MARS_diagTime;
private _lastGameTime = MARS_gameTime;

MARS_gameTime = time;
MARS_diagTime = diag_tickTime;

private _delta = MARS_diagTime - _lastTickTime;

if (MARS_gameTime <= _lastGameTime) then {
    MARS_paused = true;
    ADD(MARS_pausedTime,_delta);
    MARS_virtualPausedTime = MARS_pausedTime + (_delta * accTime);
} else {
    MARS_paused = false;
    ADD(MARS_realTime,_delta);
    ADD(MARS_virtualTime,_delta * accTime);
    MARS_time = MARS_virtualTime;
};
