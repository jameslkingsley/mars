#include "script_component.hpp"

player createDiarySubject ["Mars", "Mars"];

if (isServer) then {
    missionNamespace setVariable [QGVAR(virtualGroups), [], true];
};

["isNotPlayer", {{isPlayer _x} count _this == 0}] call FUNC(addException);
["isAlive", {{!alive _x} count _this == 0}] call FUNC(addException);
["isDead", {{alive _x} count _this == 0}] call FUNC(addException);
["isLeader", {{leader _x == _x} count _this == count _this}] call FUNC(addException);
["allSameClass", {[_this] call FUNC(isAllSameClass)}] call FUNC(addException);
["vehicleHasAmmo", {{[_x] call FUNC(hasAmmo)} count _this == count _this}] call FUNC(addException);

[QGVAR(createMarkerLocal), {
    _this call FUNC(createMarkerLocal);
}] call CBA_fnc_addEventHandler;
