#include "script_component.hpp"

[QEGVAR(editor,EditorOpened), {
    [GVAR(spectatorOn)] call FUNC(toggleSpectator);
}] call CBA_fnc_addEventHandler;
