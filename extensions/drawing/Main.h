#pragma once

#include "intercept.hpp"
#include "uncategorized.hpp"

#define MODPREFIX mars
#define COMPONENT editor
#define ADDON MODPREFIX ## _ ## COMPONENT
#define QUOTE(VARNAME) #VARNAME
#define GVAR(VARNAME) ADDON ## _ ## VARNAME
#define QGVAR(VARNAME) QUOTE(GVAR(VARNAME))
#define GVARMAIN(VARNAME) MODPREFIX ## _ ## VARNAME
#define QGVARMAIN(VARNAME) QUOTE(GVARMAIN(VARNAME))
#define GETVAR(VARNAME,DEFAULT) (sqf::get_variable(sqf::mission_namespace(), QGVAR(VARNAME), DEFAULT))

#define SIDE_WEST 1
#define SIDE_EAST 0
#define SIDE_GUER 2
#define SIDE_CIV 3

#define COLOR_WEST 0.0f, 0.3f, 0.6f, 1.0f
#define COLOR_EAST 0.5f, 0.0f, 0.0f, 1.0f
#define COLOR_GUER 0.0f, 0.5f, 0.0f, 1.0f
#define COLOR_CIV 0.4f, 0.0f, 0.5f, 1.0f
