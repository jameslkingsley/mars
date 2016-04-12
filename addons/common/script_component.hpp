#define COMPONENT common
#include "\z\mars\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_COMMON
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMMON
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMMON
#endif

#include "\z\mars\addons\main\script_macros.hpp"

#define WEST_COLOR ([west] call BIS_fnc_sideColor)
#define EAST_COLOR ([east] call BIS_fnc_sideColor)
#define GUER_COLOR ([resistance] call BIS_fnc_sideColor)
#define CIV_COLOR ([civilian] call BIS_fnc_sideColor)
#define UNKNOWN_COLOR ([sideUnknown] call BIS_fnc_sideColor)
