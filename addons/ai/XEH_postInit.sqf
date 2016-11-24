#include "script_component.hpp"

["selectionToPosition", QFUNC(selectionToPosition)] call CFUNC(addEventHandler);

[QGVAR(taskAttack), {[_this] call FUNC(taskAttack)}] call CBA_fnc_addEventHandler;
[QGVAR(taskOrbit), {_this call FUNC(taskOrbit)}] call CBA_fnc_addEventHandler;
[QGVAR(taskParadrop), {[_this] call FUNC(taskParadrop)}] call CBA_fnc_addEventHandler;
[QGVAR(taskLand), {[_this] call FUNC(taskLand)}] call CBA_fnc_addEventHandler;
[QGVAR(taskDefend), {[_this] call FUNC(taskDefend)}] call CBA_fnc_addEventHandler;
[QGVAR(taskPatrol), {[_this] call FUNC(taskPatrol)}] call CBA_fnc_addEventHandler;
[QGVAR(forceSpeed), {_this call FUNC(forceSpeed)}] call CBA_fnc_addEventHandler;
[QGVAR(setUnitPos), {_this call FUNC(setUnitPos)}] call CBA_fnc_addEventHandler;
[QGVAR(forceMove), {[_this] call FUNC(forceMove)}] call CBA_fnc_addEventHandler;
[QGVAR(suppress), {[_this] call FUNC(suppress)}] call CBA_fnc_addEventHandler;
[QGVAR(searchNearby), {[_this] call FUNC(searchNearby)}] call CBA_fnc_addEventHandler;
[QGVAR(disableAI), {_this call FUNC(disableAI)}] call CBA_fnc_addEventHandler;
[QGVAR(garrison), {_this call FUNC(_garrison)}] call CBA_fnc_addEventHandler;
[QGVAR(groupMove), {[_this] call FUNC(groupMove)}] call CBA_fnc_addEventHandler;
[QGVAR(disembark), {[_this] call FUNC(disembark)}] call CBA_fnc_addEventHandler;
[QGVAR(setFormation), {_this call FUNC(setFormation)}] call CBA_fnc_addEventHandler;

GVAR(stateMachine) = [configFile >> QGVARMAIN(StateMachines) >> QADDON] call CBA_statemachine_fnc_createFromConfig;

["Assigned Target", {assignedTarget _this}, true] call EFUNC(editor,addToDebugPanel);
["Suppression", {getSuppression _this}, true] call EFUNC(editor,addToDebugPanel);
["Fleeing", {fleeing _this}, true] call EFUNC(editor,addToDebugPanel);
["Behaviour", {behaviour _this}, true] call EFUNC(editor,addToDebugPanel);
["Combat Mode", {combatMode _this}, true] call EFUNC(editor,addToDebugPanel);
["Group Status", {[group _this] call CFUNC(getGroupStatus)}, true] call EFUNC(editor,addToDebugPanel);
