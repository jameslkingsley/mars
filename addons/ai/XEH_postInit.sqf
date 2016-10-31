#include "script_component.hpp"

["selectionToPosition", QFUNC(selectionToPosition)] call CFUNC(addEventHandler);

[QGVAR(taskAttack), {[_this] call FUNC(taskAttack)}] call CBA_fnc_addEventHandler;
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

[{
    private _hint = "";

    {
        _hint = format ["%1\n%2: %3", _hint, _x, moveToCompleted _x];
    } forEach EGVAR(editor,selection);

    hintSilent _hint;
}, 0, []] call CBA_fnc_addPerFrameHandler;
