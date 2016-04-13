#include "script_component.hpp"

if (isServer) then {
    GVAR(zeusCenter) = createCenter sideLogic;
};

if (isNil QGVAR(zeusModule)) then {
    GVAR(zeusModule) = objNull;
};