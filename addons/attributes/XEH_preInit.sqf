#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

SETUVAR(GVAR(interface),displayNull);

GVAR(isOpen) = false;

GVAR(AttributesWindow_onLoad) = -1;
GVAR(AttributesWindow_onUnload) = -1;
GVAR(AttributesWindow_onConfirm) = -1;
GVAR(AttributesWindow_onCancel) = -1;
GVAR(AttributesWindow_ItemControls) = [];

GVAR(identifyControls) = [];

ADDON = true;
