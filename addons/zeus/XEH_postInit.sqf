#include "script_component.hpp"

if (isServer) then {
    GVAR(zeusCenter) = createCenter sideLogic;
};

GVAR(zeusModule) = objNull;
