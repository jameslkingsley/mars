#include "script_component.hpp"

["EditorOpened", {
    [QUOTE(ADDON), "environment"] call EFUNC(attributes,openAttributes);
}] call EFUNC(common,addEventHandler);