#define COMPONENT editor
#include "\z\mars\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_EDITOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_EDITOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EDITOR
#endif

#include "\z\mars\addons\main\script_macros.hpp"

#include "UI\resinc.hpp"

#define PANEL_W 60
#define MENUBAR_H 5
#define TOOLBAR_H (5 + 2)
#define TAB_H (5 + 1)
#define STATUSBAR_W safezoneW
#define STATUSBAR_H 4
#define CONTROLSHINT_W 50
#define PLAYBUTTON_H 10
#define NAV_H 15
#define TRANSPARENT_A 0.87

#define pixelScale 1.25
#define pixelGrid 4

#define GRID_TOOLBAR_W	(5 * (pixelW * pixelScale * pixelGrid))
#define GRID_TOOLBAR_H	(5 * (pixelH * pixelScale * pixelGrid))

#define MENU_Y safezoneY
#define MENU_HEIGHT (MENUBAR_H * (pixelH * pixelScale * pixelGrid))
#define CAM_SHIFT_SPEED_COEF 5
#define CAM_DEFAULT_SPEED 1.5
#define CAM_DEFAULT_ZOOM 1

#define TYPE_SEARCH ["Man","Car","Air","Tank","Truck","Ship"]
#define FULL_TYPE_SEARCH [(screenToWorld GVAR(mousePos)), TYPE_SEARCH, 4]

#define MENUSTRIP_CONTEXT_WIDTH (0.12 * safeZoneW)
#define MENUSTRIP_CONTEXT_HEIGHT (MENUBAR_H * (pixelH * pixelScale * pixelGrid))

#define CONTEXT_OPTION_WIDTH (0.1 * safeZoneW)
#define CONTEXT_OPTION_HEIGHT (0.025 * safeZoneH)

// #define ICON_FADE_DISTANCE (profileNamespace getVariable [QEGVAR(clientmenu,viewDistance), 2000])
#define ICON_FADE_DISTANCE 2500
#define BOX_FADE_DISTANCE 500
#define ICON_LEADER_HEIGHT 7.5
#define ICON_HOVER_SIZE 1.5

#define AB_TREE_POS [\
        (0.85 * safeZoneW + safeZoneX),\
        (0.159 * safeZoneH + safeZoneY),\
        (0.15 * safeZoneW),\
        (safeZoneH - 0.288)\
    ]

#define DEFAULT_TAB_OPACITY 0.33

#define AB_CATEGORY_OBJECTS ["Ammo","Anomalies","Armory","Backpacks","Camera","Cargo","Communication","Container","Dead_bodies","Emitters","Explosives","Flag","Fortifications","Furniture","Garbage","Helpers","Intel","Items","ItemsHeadgear","ItemsUniforms","ItemsVests","Lamps","Magazines","Market","Military","Mines","Misc","Objects_Airport","Objects_Sports","Objects_VR","Ruins","Shelters","Ship","Signs","Small_items","Static","Structures","Structures_Airport","Structures_Commercial","Structures_Cultural","Structures_Fences","Structures_Industrial","Structures_Infrastructure","Structures_Military","Structures_Slums","Structures_Sports","Structures_Town","Structures_Transport","Structures_Village","Structures_VR","Structures_Walls","Submerged","Support","Targets","Tents","Test","Training","Uniforms","WeaponAccessories","WeaponsHandguns","WeaponsPrimary","WeaponsSecondary","Wreck","Wreck_sub"]

#define AB_CATEGORY_UNITS ["Afroamerican","Air","Armored","Asian","Autonomous","Car","European","Men","MenArmy","MenCIV","MenDiver","MenRACS","MenRecon","MenSage","MenSLA","MenSniper","MenSpecFor","MenStory","MenSupport","MenUrban","MenVR","MenWood","Submarine","Women"]
