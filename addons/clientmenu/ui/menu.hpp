#include "\z\arcmc\addons\common\define.hpp"

class GVAR(clientMenu) {
    idd = 600001;
    movingEnable = true;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(clientMenu)), _this select 0)]; [_this select 0] call FUNC(onMenuOpen););
    onUnload = QUOTE([] call FUNC(onMenuClose));
};