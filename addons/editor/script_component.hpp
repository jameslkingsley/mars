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

#include "UI\resinc.hpp"

#define MENU_Y (0 * safeZoneH + safeZoneY)
#define MENU_HEIGHT (0.03 * safeZoneH)
#define CAM_SHIFT_SPEED_COEF 5

#define TYPE_SEARCH ["Man","Car","Air","Tank","Truck","Ship"]
#define FULL_TYPE_SEARCH [(screenToWorld GVAR(mousePos)), TYPE_SEARCH, 5]

#define TOOLBAR_CONTEXT_WIDTH (0.12 * safeZoneW)
#define TOOLBAR_CONTEXT_HEIGHT (0.028 * safeZoneH)

#define CONTEXT_OPTION_WIDTH (0.1 * safeZoneW)
#define CONTEXT_OPTION_HEIGHT (0.025 * safeZoneH)

// #define ICON_FADE_DISTANCE (profileNamespace getVariable [QEGVAR(clientmenu,viewDistance), 2000])
#define ICON_FADE_DISTANCE 1500
#define BOX_FADE_DISTANCE 500

#define AB_TREE_POS [\
        (0.85 * safeZoneW + safeZoneX),\
        (0.159 * safeZoneH + safeZoneY),\
        (0.15 * safeZoneW),\
        (safeZoneH - 0.288)\
    ]

#define DEFAULT_TAB_OPACITY 0.33

#define AB_CATEGORY_OBJECTS ["Ammo","Anomalies","Armory","Backpacks","Camera","Cargo","Communication","Container","Dead_bodies","Emitters","Explosives","Flag","Fortifications","Furniture","Garbage","Helpers","Intel","Items","ItemsHeadgear","ItemsUniforms","ItemsVests","Lamps","Magazines","Market","Military","Mines","Misc","Objects_Airport","Objects_Sports","Objects_VR","Ruins","Shelters","Ship","Signs","Small_items","Static","Structures","Structures_Airport","Structures_Commercial","Structures_Cultural","Structures_Fences","Structures_Industrial","Structures_Infrastructure","Structures_Military","Structures_Slums","Structures_Sports","Structures_Town","Structures_Transport","Structures_Village","Structures_VR","Structures_Walls","Submerged","Support","Targets","Tents","Test","Training","Uniforms","WeaponAccessories","WeaponsHandguns","WeaponsPrimary","WeaponsSecondary","Wreck","Wreck_sub"]

#define AB_CATEGORY_UNITS ["Afroamerican","Air","Armored","Asian","Autonomous","Car","European","Men","MenArmy","MenCIV","MenDiver","MenRACS","MenRecon","MenSage","MenSLA","MenSniper","MenSpecFor","MenStory","MenSupport","MenUrban","MenVR","MenWood","Submarine","Women"]
