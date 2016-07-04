#include "script_component.hpp"

[QEGVAR(editor,shutdown), {
    [false] call FUNC(toggleSpectator);
}] call CBA_fnc_addEventHandler;