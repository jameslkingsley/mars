#define COMPONENT artillery
#include "\z\mars\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ARTILLERY
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ARTILLERY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ARTILLERY
#endif

#include "\z\mars\addons\main\script_macros.hpp"
