#include "script_component.hpp"

player createDiarySubject ["Mars", "Mars"];

if (isServer) then {
    missionNamespace setVariable [QGVAR(virtualGroups), [], true];
};