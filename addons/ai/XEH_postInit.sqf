#include "script_component.hpp"

_parent = ["AI", "AI", "alive _this && !isPlayer _this", ""] call EFUNC(editor,addContextParent);

[_parent, "FleeArea", "Flee Area", "", {
    _this allowFleeing 1;
}] call EFUNC(editor,addContextChild);