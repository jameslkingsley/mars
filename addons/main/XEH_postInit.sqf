diag_log "[mars] postInit";

if !(hasInterface) exitWith {};

["ARCOMM", "OpenMissionControl", ["Open Mission Control", "Press to open the mission control interface"], {
    hint "OpenMissionControl: true";
}, ""] call CBA_fnc_addKeybind;