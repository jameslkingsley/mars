#define COMPONENT common
#include "\z\mars\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_COMMON
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMMON
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMMON
#endif

#include "\z\mars\addons\main\script_macros.hpp"

//#define WEST_COLOR ([west] call BIS_fnc_sideColor)
#define WEST_COLOR ([0,0,1,1])
#define EAST_COLOR ([east] call BIS_fnc_sideColor)
#define GUER_COLOR ([resistance] call BIS_fnc_sideColor)
#define CIV_COLOR ([civilian] call BIS_fnc_sideColor)
#define UNKNOWN_COLOR ([sideUnknown] call BIS_fnc_sideColor)
