#define COMPONENT editor
#include "\z\mars\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_EDITOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_EDITOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EDITOR
#endif

#include "\z\mars\addons\main\script_macros.hpp"

#define MENU_Y (0 * safeZoneH + safeZoneY)
#define MENU_HEIGHT (0.03 * safeZoneH)
#define CAM_SHIFT_SPEED_COEF 5

#define TYPE_SEARCH ["Man","Car","Air","Tank","Truck","Ship"]
#define FULL_TYPE_SEARCH [(screenToWorld GVAR(mousePos)), TYPE_SEARCH, 5]

#define CONTEXT_OPTION_WIDTH (0.1 * safeZoneW)
#define CONTEXT_OPTION_HEIGHT (0.025 * safeZoneH)

// #define ICON_FADE_DISTANCE (profileNamespace getVariable [QEGVAR(clientmenu,viewDistance), 2000])
#define ICON_FADE_DISTANCE 1500
#define BOX_FADE_DISTANCE 500

#define IDC_MENUBAR 100
#define IDC_LEFTPANEL 101
#define IDC_RIGHTPANEL 102
#define IDC_ENTITYLIST 200
#define IDC_ASSETBROWSER 201
#define IDC_ASSETBROWSER_TREE 221
#define IDC_ASSETBROWSER_TAB 2010
#define IDC_ASSETBROWSER_SUBTAB 20100

#define AB_TREE_POS [\
        (0.85 * safeZoneW + safeZoneX),\
        (0.1 * safeZoneH + safeZoneY),\
        (0.15 * safeZoneW),\
        (safeZoneH - 0.1)\
    ]

#define DEFAULT_TAB_OPACITY 0.33