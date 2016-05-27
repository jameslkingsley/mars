#define COMPONENT attributes
#include "\z\mars\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ATTRIBUTES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ATTRIBUTES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ATTRIBUTES
#endif

#include "\z\mars\addons\main\script_macros.hpp"

#include "UI\resinc.hpp"

#ifndef WINDOW_EDITATTRIBUTES_W
    #define WINDOW_EDITATTRIBUTES_W	140
#endif

#ifndef WINDOW_EDITATTRIBUTES_H
    #define WINDOW_EDITATTRIBUTES_H	180
#endif
