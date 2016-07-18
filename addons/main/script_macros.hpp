#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#define QCOMPONENT QUOTE(COMPONENT)
#define QADDON QUOTE(ADDON)

// Default versioning level
#define DEFAULT_VERSIONING_LEVEL 2

#define DGVAR(varName) if (isNil "MARS_DEBUG_NAMESPACE") then { MARS_DEBUG_NAMESPACE = []; }; if(!(QGVAR(varName) in MARS_DEBUG_NAMESPACE)) then { PUSH(MARS_DEBUG_NAMESPACE, QGVAR(varName)); }; GVAR(varName)
#define DVAR(varName) if (isNil "MARS_DEBUG_NAMESPACE") then { MARS_DEBUG_NAMESPACE = []; }; if(!(QUOTE(varName) in MARS_DEBUG_NAMESPACE)) then { PUSH(MARS_DEBUG_NAMESPACE, QUOTE(varName)); }; varName
#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)

#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(var1),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(var1),var2,true)]

#undef GETVAR
#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define GETUVAR(var1,var2) uiNamespace GETVAR_SYS(var1,var2)
#define GETPRVAR(var1,var2) profileNamespace GETVAR_SYS(var1,var2)
#define GETPAVAR(var1,var2) parsingNamespace GETVAR_SYS(var1,var2)

#undef SETVAR
#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETUVAR(var1,var2) uiNamespace SETVAR_SYS(var1,var2)
#define SETPRVAR(var1,var2) profileNamespace SETVAR_SYS(var1,var2)
#define SETPAVAR(var1,var2) parsingNamespace SETVAR_SYS(var1,var2)

#define GETGVAR(var1,var2) GETMVAR(GVAR(var1),var2)
#define GETEGVAR(var1,var2,var3) GETMVAR(EGVAR(var1,var2),var3)

#define ARR_SELECT(ARRAY,INDEX,DEFAULT) if (count ARRAY > INDEX) then {ARRAY select INDEX} else {DEFAULT}

#define TYPE_DEFAULT 0
#define TYPE_MUZZLE 101
#define TYPE_OPTICS 201
#define TYPE_FLASHLIGHT 301
#define TYPE_BIPOD 302
#define TYPE_FIRST_AID_KIT 401
#define TYPE_FINS 501 // not implemented
#define TYPE_BREATHING_BOMB 601 // not implemented
#define TYPE_NVG 602
#define TYPE_GOGGLE 603
#define TYPE_SCUBA 604 // not implemented
#define TYPE_HEADGEAR 605
#define TYPE_FACTOR 607
#define TYPE_RADIO 611
#define TYPE_HMD 616
#define TYPE_BINOCULAR 617
#define TYPE_MEDIKIT 619
#define TYPE_TOOLKIT 620
#define TYPE_UAV_TERMINAL 621
#define TYPE_VEST 701
#define TYPE_UNIFORM 801
#define TYPE_BACKPACK 901

#ifdef DISABLE_COMPILE_CACHE
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define PREP_MODULE(folder) [] call compile preprocessFileLineNumbers QPATHTOF(folder\__PREP__.sqf)

#define MARS_isHC (!hasInterface && !isDedicated)

#define IDC_STAMINA_BAR 193

//By default CBA's TRACE/LOG/WARNING spawn a buffer, which can cause messages to be logged out of order:
#ifdef CBA_DEBUG_SYNCHRONOUS
    #define CBA_fnc_log { params ["_file","_lineNum","_message"]; diag_log [diag_frameNo, diag_tickTime, time,  _file + ":"+str(_lineNum + 1), _message]; }
#endif

#define MARS_LOG(module,level,message) diag_log text MARS_LOGFORMAT(module,level,message)
#define MARS_LOGFORMAT(module,level,message) FORMAT_2(QUOTE([MARS] (module) %1: %2),level,message)

#define MARS_LOGERROR(message) MARS_LOG(COMPONENT,"ERROR",message)
#define MARS_LOGERROR_1(message,arg1) MARS_LOGERROR(FORMAT_1(message,arg1))
#define MARS_LOGERROR_2(message,arg1,arg2) MARS_LOGERROR(FORMAT_2(message,arg1,arg2))
#define MARS_LOGERROR_3(message,arg1,arg2,arg3) MARS_LOGERROR(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_LOGERROR_4(message,arg1,arg2,arg3,arg4) MARS_LOGERROR(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_LOGERROR_5(message,arg1,arg2,arg3,arg4,arg5) MARS_LOGERROR(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_LOGERROR_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_LOGERROR(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_LOGERROR_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_LOGERROR(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_LOGERROR_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_LOGERROR(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_ERRORFORMAT(message) MARS_LOGFORMAT(COMPONENT,"ERROR",message)
#define MARS_ERRORFORMAT_1(message,arg1) MARS_ERRORFORMAT(FORMAT_1(message,arg1))
#define MARS_ERRORFORMAT_2(message,arg1,arg2) MARS_ERRORFORMAT(FORMAT_2(message,arg1,arg2))
#define MARS_ERRORFORMAT_3(message,arg1,arg2,arg3) MARS_ERRORFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_ERRORFORMAT_4(message,arg1,arg2,arg3,arg4) MARS_ERRORFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_ERRORFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) MARS_ERRORFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_ERRORFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_ERRORFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_ERRORFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_ERRORFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_ERRORFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_ERRORFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_LOGWARNING(message) MARS_LOG(COMPONENT,"WARNING",message)
#define MARS_LOGWARNING_1(message,arg1) MARS_LOGWARNING(FORMAT_1(message,arg1))
#define MARS_LOGWARNING_2(message,arg1,arg2) MARS_LOGWARNING(FORMAT_2(message,arg1,arg2))
#define MARS_LOGWARNING_3(message,arg1,arg2,arg3) MARS_LOGWARNING(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_LOGWARNING_4(message,arg1,arg2,arg3,arg4) MARS_LOGWARNING(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_LOGWARNING_5(message,arg1,arg2,arg3,arg4,arg5) MARS_LOGWARNING(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_LOGWARNING_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_LOGWARNING(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_LOGWARNING_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_LOGWARNING(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_LOGWARNING_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_LOGWARNING(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_WARNINGFORMAT(message) MARS_LOGFORMAT(COMPONENT,"WARNING",message)
#define MARS_WARNINGFORMAT_1(message,arg1) MARS_WARNINGFORMAT(FORMAT_1(message,arg1))
#define MARS_WARNINGFORMAT_2(message,arg1,arg2) MARS_WARNINGFORMAT(FORMAT_2(message,arg1,arg2))
#define MARS_WARNINGFORMAT_3(message,arg1,arg2,arg3) MARS_WARNINGFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_WARNINGFORMAT_4(message,arg1,arg2,arg3,arg4) MARS_WARNINGFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_WARNINGFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) MARS_WARNINGFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_WARNINGFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_WARNINGFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_WARNINGFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_WARNINGFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_WARNINGFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_WARNINGFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_LOGINFO(message) MARS_LOG(COMPONENT,"INFO",message)
#define MARS_LOGINFO_1(message,arg1) MARS_LOGINFO(FORMAT_1(message,arg1))
#define MARS_LOGINFO_2(message,arg1,arg2) MARS_LOGINFO(FORMAT_2(message,arg1,arg2))
#define MARS_LOGINFO_3(message,arg1,arg2,arg3) MARS_LOGINFO(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_LOGINFO_4(message,arg1,arg2,arg3,arg4) MARS_LOGINFO(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_LOGINFO_5(message,arg1,arg2,arg3,arg4,arg5) MARS_LOGINFO(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_LOGINFO_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_LOGINFO(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_LOGINFO_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_LOGINFO(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_LOGINFO_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_LOGINFO(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_INFOFORMAT(message) MARS_LOGFORMAT(COMPONENT,"INFO",message)
#define MARS_INFOFORMAT_1(message,arg1) MARS_INFOFORMAT(FORMAT_1(message,arg1))
#define MARS_INFOFORMAT_2(message,arg1,arg2) MARS_INFOFORMAT(FORMAT_2(message,arg1,arg2))
#define MARS_INFOFORMAT_3(message,arg1,arg2,arg3) MARS_INFOFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_INFOFORMAT_4(message,arg1,arg2,arg3,arg4) MARS_INFOFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_INFOFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) MARS_INFOFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_INFOFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_INFOFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_INFOFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_INFOFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_INFOFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_INFOFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_LOGDEBUG(message) MARS_LOG(COMPONENT,"DEBUG",message)
#define MARS_LOGDEBUG_1(message,arg1) MARS_LOGDEBUG(FORMAT_1(message,arg1))
#define MARS_LOGDEBUG_2(message,arg1,arg2) MARS_LOGDEBUG(FORMAT_2(message,arg1,arg2))
#define MARS_LOGDEBUG_3(message,arg1,arg2,arg3) MARS_LOGDEBUG(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_LOGDEBUG_4(message,arg1,arg2,arg3,arg4) MARS_LOGDEBUG(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_LOGDEBUG_5(message,arg1,arg2,arg3,arg4,arg5) MARS_LOGDEBUG(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_LOGDEBUG_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_LOGDEBUG(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_LOGDEBUG_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_LOGDEBUG(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_LOGDEBUG_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_LOGDEBUG(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_DEBUGFORMAT(message) MARS_LOGFORMAT(COMPONENT,"DEBUG",message)
#define MARS_DEBUGFORMAT_1(message,arg1) MARS_DEBUGFORMAT(FORMAT_1(message,arg1))
#define MARS_DEBUGFORMAT_2(message,arg1,arg2) MARS_DEBUGFORMAT(FORMAT_2(message,arg1,arg2))
#define MARS_DEBUGFORMAT_3(message,arg1,arg2,arg3) MARS_DEBUGFORMAT(FORMAT_3(message,arg1,arg2,arg3))
#define MARS_DEBUGFORMAT_4(message,arg1,arg2,arg3,arg4) MARS_DEBUGFORMAT(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define MARS_DEBUGFORMAT_5(message,arg1,arg2,arg3,arg4,arg5) MARS_DEBUGFORMAT(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define MARS_DEBUGFORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6) MARS_DEBUGFORMAT(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define MARS_DEBUGFORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) MARS_DEBUGFORMAT(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define MARS_DEBUGFORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) MARS_DEBUGFORMAT(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define MARS_DEPRECATED(arg1,arg2,arg3) MARS_LOGWARNING_3("%1 is deprecated. Support will be dropped in version %2. Replaced by: %3",arg1,arg2,arg3)

#define PFORMAT_10(MESSAGE,A,B,C,D,E,F,G,H,I,J) \
    format ['%1: A=%2, B=%3, C=%4, D=%5, E=%6, F=%7, G=%8, H=%9, I=%10 J=%11', MESSAGE, RETNIL(A), RETNIL(B), RETNIL(C), RETNIL(D), RETNIL(E), RETNIL(F), RETNIL(G), RETNIL(H), RETNIL(I), RETNIL(J)]
#ifdef DEBUG_MODE_FULL
#define TRACE_10(MESSAGE,A,B,C,D,E,F,G,H,I,J) \
    [THIS_FILE_, __LINE__, PFORMAT_10(MESSAGE,A,B,C,D,E,F,G,H,I,J)] call CBA_fnc_log
#else
   #define TRACE_10(MESSAGE,A,B,C,D,E,F,G,H,I,J) /* disabled */
#endif

#define MARS_SIDECOLOR(side) ([(side)] call EFUNC(common,getSideColor))

#define COLOR_DEFAULT_RGB_R 0.741
#define COLOR_DEFAULT_RGB_G 0.173
#define COLOR_DEFAULT_RGB_B 0.173
#define COLOR_DEFAULT_RGB_A 1
#define COLOR_DEFAULT_RGB COLOR_DEFAULT_RGB_R,COLOR_DEFAULT_RGB_G,COLOR_DEFAULT_RGB_B
#define COLOR_DEFAULT_RGBA COLOR_DEFAULT_RGB,COLOR_DEFAULT_RGB_A

#define COLOR_ACTIVE_RGB_R_S (GETPRVAR(MARS_ACCENT_R,0.741))
#define COLOR_ACTIVE_RGB_G_S (GETPRVAR(MARS_ACCENT_G,0.173))
#define COLOR_ACTIVE_RGB_B_S (GETPRVAR(MARS_ACCENT_B,0.173))
#define COLOR_ACTIVE_RGB_S COLOR_ACTIVE_RGB_R_S,COLOR_ACTIVE_RGB_G_S,COLOR_ACTIVE_RGB_B_S
#define COLOR_ACTIVE_RGBA_S COLOR_ACTIVE_RGB_S,COLOR_ACTIVE_RGB_A

#define COLOR_ACTIVE_RGB_R QUOTE(COLOR_ACTIVE_RGB_R_S)
#define COLOR_ACTIVE_RGB_G QUOTE(COLOR_ACTIVE_RGB_G_S)
#define COLOR_ACTIVE_RGB_B QUOTE(COLOR_ACTIVE_RGB_B_S)
#define COLOR_ACTIVE_RGB_A 1
#define COLOR_ACTIVE_RGB COLOR_ACTIVE_RGB_R,COLOR_ACTIVE_RGB_G,COLOR_ACTIVE_RGB_B
#define COLOR_ACTIVE_RGBA COLOR_ACTIVE_RGB,COLOR_ACTIVE_RGB_A

#define COLOR_WEST_R (GETPRVAR(map_blufor_r,0))
#define COLOR_WEST_G (GETPRVAR(map_blufor_g,0.3))
#define COLOR_WEST_B (GETPRVAR(map_blufor_b,0.6))
#define COLOR_WEST_A (GETPRVAR(map_blufor_a,1))
#define COLOR_WEST_RGB COLOR_WEST_R,COLOR_WEST_G,COLOR_WEST_B
#define COLOR_WEST_RGBA COLOR_WEST_RGB,COLOR_WEST_A

#define COLOR_EAST_R (GETPRVAR(map_opfor_r,0.5))
#define COLOR_EAST_G (GETPRVAR(map_opfor_g,0))
#define COLOR_EAST_B (GETPRVAR(map_opfor_b,0))
#define COLOR_EAST_A (GETPRVAR(map_opfor_a,1))
#define COLOR_EAST_RGB COLOR_EAST_R,COLOR_EAST_G,COLOR_EAST_B
#define COLOR_EAST_RGBA COLOR_EAST_RGB,COLOR_EAST_A

#define COLOR_GUER_R (GETPRVAR(map_independent_r,0))
#define COLOR_GUER_G (GETPRVAR(map_independent_g,0.5))
#define COLOR_GUER_B (GETPRVAR(map_independent_b,0))
#define COLOR_GUER_A (GETPRVAR(map_independent_a,1))
#define COLOR_GUER_RGB COLOR_GUER_R,COLOR_GUER_G,COLOR_GUER_B
#define COLOR_GUER_RGBA COLOR_GUER_RGB,COLOR_GUER_A

#define COLOR_CIV_R (GETPRVAR(map_independent_r,0.4))
#define COLOR_CIV_G (GETPRVAR(map_independent_g,0))
#define COLOR_CIV_B (GETPRVAR(map_independent_b,0.5))
#define COLOR_CIV_A (GETPRVAR(map_independent_a,1))
#define COLOR_CIV_RGB COLOR_CIV_R,COLOR_CIV_G,COLOR_CIV_B
#define COLOR_CIV_RGBA COLOR_CIV_RGB,COLOR_CIV_A

#define COLOR_EMPTY_R (GETPRVAR(map_unknown_r,0.7))
#define COLOR_EMPTY_G (GETPRVAR(map_unknown_g,0.6))
#define COLOR_EMPTY_B (GETPRVAR(map_unknown_b,0))
#define COLOR_EMPTY_A (GETPRVAR(map_unknown_a,1))
#define COLOR_EMPTY_RGB COLOR_EMPTY_R,COLOR_EMPTY_G,COLOR_EMPTY_B
#define COLOR_EMPTY_RGBA COLOR_EMPTY_RGB,COLOR_EMPTY_A

#define COLOR_AMBIENT_RGB 0,1,0.5
#define COLOR_AMBIENT_RGBA COLOR_AMBIENT_RGB,1

#define COLOR_POSX_RGB	0.77, 0.18, 0.1
#define COLOR_POSX_RGBA	COLOR_POSX_RGB, 1

#define COLOR_POSY_RGB	0.58, 0.82, 0.22
#define COLOR_POSY_RGBA	COLOR_POSY_RGB, 1

#define COLOR_POSZ_RGB	0.26, 0.52, 0.92
#define COLOR_POSZ_RGBA	COLOR_POSZ_RGB, 1

#define REMOTE_GLOBAL 0
#define REMOTE_SERVER 2
#define REMOTE_EXSERVER -2

#define CFUNC(A) EFUNC(common,A)
#define AFUNC(A) EFUNC(attributes,A)

#define INT2BOOL(A) ([false,true] select A)
#define BOOL2INT(A) ([0,1] select A)

#define IS_SERVER_OR_HC (isServer || !hasInterface)

#include "script_debug.hpp"
