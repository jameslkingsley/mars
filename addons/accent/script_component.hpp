#define COMPONENT accent
#include "\z\mars\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ACCENT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ACCENT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ACCENT
#endif

#include "\z\mars\addons\main\script_macros.hpp"

#define IDC_ACCENT_DISPLAY 600005
#define IDC_ACCENT_SLIDER_R 1900
#define IDC_ACCENT_SLIDER_G 1901
#define IDC_ACCENT_SLIDER_B 1902
#define IDC_ACCENT_BUTTON_SAVE 1903
#define IDC_ACCENT_BUTTON_DEFAULT 1905
#define IDC_ACCENT_SAMPLE 1904
