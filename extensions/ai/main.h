#pragma once

#include "intercept.hpp"

#define MODPREFIX mars
#define COMPONENT ai
#define ADDON MODPREFIX ## _ ## COMPONENT
#define QUOTE(VARNAME) #VARNAME
#define GVAR(VARNAME) ADDON ## _ ## VARNAME
#define QGVAR(VARNAME) QUOTE(GVAR(VARNAME))
#define GVARMAIN(VARNAME) MODPREFIX ## _ ## VARNAME
#define QGVARMAIN(VARNAME) QUOTE(GVARMAIN(VARNAME))
#define GETVAR(VARNAME) sqf::get_variable( sqf::mission_namespace(), QGVAR(VARNAME) )
