#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer) then {
    GVAR(headlessClients) = [];
    publicVariable QGVAR(headlessClients);
    [QGVAR(connected), FUNC(handleConnectHC)] call CBA_fnc_addEventHandler;
};

ADDON = true;
