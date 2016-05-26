#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

SETUVAR(GVAR(interface),displayNull);

GVAR(AttributesWindow_onLoad) = -1;
GVAR(AttributesWindow_onUnload) = -1;

ADDON = true;
