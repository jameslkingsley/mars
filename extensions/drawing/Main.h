#include <Windows.h>
#include <stdio.h>
#include <cstdint>
#include <atomic>

#include "intercept.hpp"
#include "uncategorized.hpp"

#define MODPREFIX mars
#define COMPONENT editor
#define ADDON MODPREFIX_COMPONENT
#define QUOTE(VARNAME) #VARNAME
#define GVAR(VARNAME) ADDON_VARNAME
#define QGVAR(VARNAME) QUOTE(GVAR(VARNAME))
#define GVARMAIN(VARNAME) MODPREFIX_VARNAME
#define QGVARMAIN(VARNAME) QUOTE(GVARMAIN(VARNAME))
#define GETVAR(VARNAME,DEFAULT) sqf::get_variable(sqf::mission_namespace(), QGVAR(VARNAME), DEFAULT)

#define SIDE_WEST 1
#define SIDE_EAST 0
#define SIDE_GUER 2
#define SIDE_CIV 3

#define RGB_WEST 0.0f, 0.3f, 0.6f
#define RGB_EAST 0.5f, 0.0f, 0.0f
#define RGB_GUER 0.0f, 0.5f, 0.0f
#define RGB_CIV 0.4f, 0.0f, 0.5f

#define RGBA_WEST RGB_WEST, 1.0f
#define RGBA_EAST RGB_EAST, 1.0f
#define RGBA_GUER RGB_GUER, 1.0f
#define RGBA_CIV RGB_CIV, 1.0f

#define ICON_FADE_DISTANCE 2000.0f
#define BOX_FADE_DISTANCE 500.0f