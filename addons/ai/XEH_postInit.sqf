#include "script_component.hpp"

["FleeArea", "Flee Area", "alive _this && !isPlayer _this", {
    _this allowFleeing 1;
}] call EFUNC(editor,addContextParent);

["Patrol", "Patrol Area", "alive _this && !isPlayer _this", {
    [(group _this), (group _this)] call CBA_fnc_taskPatrol;
}] call EFUNC(editor,addContextParent);

["Destroy", "Destroy Object", "", {
    _this setDamage 1;
}] call EFUNC(editor,addContextParent);
