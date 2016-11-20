#include "script_component.hpp"

enableSaving [false, false];

if (isServer) then {
    private _settings = (configFile >> QGVARMAIN(serverSettings) >> QGVAR(players));
    
    if (isClass _settings) then {
        missionNamespace setVariable [QGVAR(alwaysAllowLoginWhenEmpty), INT2BOOL(getNumber (_settings >> "alwaysAllowLoginWhenEmpty")), true];
        missionNamespace setVariable [QGVAR(whitelisted), getArray (_settings >> "whitelisted"), true];
        missionNamespace setVariable [QGVAR(blacklisted), getArray (_settings >> "blacklisted"), true];
    } else {
        missionNamespace setVariable [QGVAR(alwaysAllowLoginWhenEmpty), true, true];
        missionNamespace setVariable [QGVAR(whitelisted), [], true];
        missionNamespace setVariable [QGVAR(blacklisted), [], true];
    };

    // Server FPS
    [{
        GVAR(fps_server) = diag_fps;
        publicVariable QGVAR(fps_server);
    }, 5, []] call CBA_fnc_addPerFrameHandler;
};

if (isNil QGVAR(initialLoginPlayer)) then {
    GVAR(initialLoginPlayer) = objNull;
    publicVariable QGVAR(initialLoginPlayer);
};

[QMODNAME, "OpenMissionEditor", ["Open Mission Editor", "Press to open the mission editor interface"], {
    if (GVAR(isRemoteControl)) then {
        [false] call FUNC(exitRemoteControl);
    };
    
    [] call FUNC(openEditor);
}, ""] call CBA_fnc_addKeybind;

// Object creation handler
[QGVAR(spawnObject), {
    _this spawn FUNC(spawnObject);
}] call CBA_fnc_addEventHandler;

// Is this needed?
createCenter west;
createCenter east;
createCenter resistance;
createCenter civilian;

[QGVAR(setDir), {
    params ["_unit", "_dir"];
    doStop _unit;
    _unit setFormDir _dir;
    _unit setDir _dir;
}] call CBA_fnc_addEventHandler;

[QGVAR(moveInAny), {
    params ["_unit", "_vehicle"];
    _unit moveInAny _vehicle;
}] call CBA_fnc_addEventHandler;

[QGVAR(spawnArsenal), {
    _this call FUNC(spawnArsenal);
}] call CBA_fnc_addEventHandler;

[QGVAR(serializeIconsForObjects), {
    params ["_objects"];
    [GETUVAR(GVAR(interface), displayNull), _objects] call FUNC(serializeIcons);
}] call CBA_fnc_addEventHandler;
