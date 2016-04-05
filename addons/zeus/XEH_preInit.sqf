#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(curator) = GVAR(logicGroup) createunit ["ModuleCurator_F", [0,0,0], [], 0.5, "NONE"];
    GVAR(curator) setVariable ["Addons", 3, true];
    GVAR(curator) setVariable ["vehicleinit","_this setVariable ['Addons',3,true];"];
    publicVariable QGVAR(curator);

    {[GVAR(curator), _x, ["%ALL"]] call BIS_fnc_setCuratorAttributes} forEach ["player","object","group","waypoint","marker"];

    _addonsType = GVAR(curator) getVariable ["Addons", 3];
    GVAR(addons) = [];

    {if (isClass _x) then {GVAR(addons) pushBack (configName _x);};} forEach ("true" configClasses (configFile >> "Cfgpatches"));

    GVAR(addons) call BIS_fnc_activateAddons;
    removeAllCuratorAddons GVAR(curator);
    GVAR(curator) addCuratorAddons GVAR(addons);
};

ADDON = true;
