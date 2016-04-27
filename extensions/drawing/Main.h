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