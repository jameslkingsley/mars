#include "dikCodes.hpp"

#define pixelScale 1.25
#define pixelGrid 4

#define GRID_W (pixelW * pixelScale * pixelGrid)
#define GRID_H (pixelH * pixelScale * pixelGrid)

#define CENTER_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_Y ((getResolution select 3) * 0.5 * pixelH)

#define WINDOW_W 120
#define WINDOW_H 180
#define WINDOW_HAbs (safezoneH min (WINDOW_H * GRID_H))

#define WINDOW_PREVIEW_W WINDOW_W
#define WINDOW_PREVIEW_H 65
#define WINDOW_PREVIEW_HAbs (safezoneH min (WINDOW_PREVIEW_H * GRID_H))

#define ATTRIBUTE_TITLE_W 48
#define ATTRIBUTE_CONTENT_W 82
#define ATTRIBUTE_CONTENT_H 5

#define FONT_NORMAL "RobotoCondensedLight"
#define FONT_BOLD "RobotoCondensedBold"
#define FONT_THIN "RobotoCondensedLight"
#define FONT2_NORMAL "PuristaMedium"
#define FONT2_BOLD "PuristaSemiBold"
#define FONT2_THIN "PuristaLight"
#define FONT_MONO "EtelkaMonospacePro"
#define FONT_NARROW "EtelkaNarrowMediumPro"
#define FONT_CODE "LucidaConsoleB"
#define FONT_SYSTEM "TahomaB"

#define SIZEEX_PURISTA(SIZEPX) __EVAL([SIZEPX,1.8,[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,37,46]] call _fnc_sizeEx)
#define SIZEEX_ETELKA(SIZEPX) __EVAL([SIZEPX,1.55,[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,37,46]] call _fnc_sizeEx)
#define SIZEEX_TAHOMA(SIZEPX) __EVAL([SIZEPX,1.6,[16]] call _fnc_sizeEx)
#define SIZEEX_LUCIDA(SIZEPX) __EVAL([SIZEPX,1.6,[8,11]] call _fnc_sizeEx)

#define SIZEEX_XS 3.0
#define SIZEEX_S 4.0
#define SIZEEX_M 4.5
#define SIZEEX_L 5.0
#define SIZEEX_XL 6.0

#define SIZE_XS 3
#define SIZE_S 4
#define SIZE_M 5
#define SIZE_L 5
#define SIZE_XL 6

#define COLOR_TEXT_RGB 1,1,1
#define COLOR_TEXT_RGBA COLOR_TEXT_RGB,1

#define COLOR_BACKGROUND_RGB 0.2,0.2,0.2
#define COLOR_BACKGROUND_RGBA COLOR_BACKGROUND_RGB,1

#define COLOR_TAB_RGB 0.1,0.1,0.1
#define COLOR_TAB_RGBA COLOR_TAB_RGB,1

#define COLOR_OVERLAY_RGB 0,0,0
#define COLOR_OVERLAY_RGBA COLOR_OVERLAY_RGB,0.5

#define COLOR_ACTIVE_RGB_R "(profileNamespace getVariable ['MARS_ACCENT_R',0.741])"
#define COLOR_ACTIVE_RGB_G "(profileNamespace getVariable ['MARS_ACCENT_G',0.173])"
#define COLOR_ACTIVE_RGB_B "(profileNamespace getVariable ['MARS_ACCENT_B',0.173])"
#define COLOR_ACTIVE_RGB_A 1
#define COLOR_ACTIVE_RGB COLOR_ACTIVE_RGB_R,COLOR_ACTIVE_RGB_G,COLOR_ACTIVE_RGB_B
#define COLOR_ACTIVE_RGBA COLOR_ACTIVE_RGB,COLOR_ACTIVE_RGB_A

#define COLOR_HIGHLIGHT_RGB	0,1,1
#define COLOR_HIGHLIGHT_RGBA COLOR_HIGHLIGHT_RGB,1

#define COLOR_POSX_RGB 0.77,0.18,0.1
#define COLOR_POSX_RGBA	COLOR_POSX_RGB,1

#define COLOR_POSY_RGB 0.58,0.82,0.22
#define COLOR_POSY_RGBA	COLOR_POSY_RGB,1

#define COLOR_POSZ_RGB 0.26,0.52,0.92
#define COLOR_POSZ_RGBA	COLOR_POSZ_RGB,1

#define COLOR_WEST_R "(profileNamespace getVariable ['Map_BLUFOR_R',0])"
#define COLOR_WEST_G "(profileNamespace getVariable ['Map_BLUFOR_G',1])"
#define COLOR_WEST_B "(profileNamespace getVariable ['Map_BLUFOR_B',1])"
#define COLOR_WEST_A "(profileNamespace getVariable ['Map_BLUFOR_A',0.8])"
#define COLOR_WEST_RGB COLOR_WEST_R,COLOR_WEST_G,COLOR_WEST_B
#define COLOR_WEST_RGBA COLOR_WEST_RGB,COLOR_WEST_A

#define COLOR_EAST_R "(profileNamespace getVariable ['Map_OPFOR_R',0])"
#define COLOR_EAST_G "(profileNamespace getVariable ['Map_OPFOR_G',1])"
#define COLOR_EAST_B "(profileNamespace getVariable ['Map_OPFOR_B',1])"
#define COLOR_EAST_A "(profileNamespace getVariable ['Map_OPFOR_A',0.8])"
#define COLOR_EAST_RGB COLOR_EAST_R,COLOR_EAST_G,COLOR_EAST_B
#define COLOR_EAST_RGBA COLOR_EAST_RGB,COLOR_EAST_A

#define COLOR_GUER_R "(profileNamespace getVariable ['Map_Independent_R',0])"
#define COLOR_GUER_G "(profileNamespace getVariable ['Map_Independent_G',1])"
#define COLOR_GUER_B "(profileNamespace getVariable ['Map_Independent_B',1])"
#define COLOR_GUER_A "(profileNamespace getVariable ['Map_Independent_A',0.8])"
#define COLOR_GUER_RGB COLOR_GUER_R,COLOR_GUER_G,COLOR_GUER_B
#define COLOR_GUER_RGBA COLOR_GUER_RGB,COLOR_GUER_A

#define COLOR_CIV_R "(profileNamespace getVariable ['Map_Civilian_R',0])"
#define COLOR_CIV_G "(profileNamespace getVariable ['Map_Civilian_G',1])"
#define COLOR_CIV_B "(profileNamespace getVariable ['Map_Civilian_B',1])"
#define COLOR_CIV_A "(profileNamespace getVariable ['Map_Civilian_A',0.8])"
#define COLOR_CIV_RGB COLOR_CIV_R,COLOR_CIV_G,COLOR_CIV_B
#define COLOR_CIV_RGBA COLOR_CIV_RGB,COLOR_CIV_A

#define COLOR_EMPTY_R "(profileNamespace getVariable ['Map_Unknown_R',0])"
#define COLOR_EMPTY_G "(profileNamespace getVariable ['Map_Unknown_G',1])"
#define COLOR_EMPTY_B "(profileNamespace getVariable ['Map_Unknown_B',1])"
#define COLOR_EMPTY_A "(profileNamespace getVariable ['Map_Unknown_A',0.8])"
#define COLOR_EMPTY_RGB COLOR_EMPTY_R,COLOR_EMPTY_G,COLOR_EMPTY_B
#define COLOR_EMPTY_RGBA COLOR_EMPTY_RGB,COLOR_EMPTY_A

#define COLOR_AMBIENT_RGB 0,1,0.5
#define COLOR_AMBIENT_RGBA COLOR_AMBIENT_RGB,1

#define CHECKBOX_TEXTURE(UNCHECKED,CHECKED)\
    textureChecked = CHECKED;\
    textureUnchecked = UNCHECKED;\
    textureFocusedChecked = CHECKED;\
    textureFocusedUnchecked = UNCHECKED;\
    textureHoverChecked = CHECKED;\
    textureHoverUnchecked = UNCHECKED;\
    texturePressedChecked = CHECKED;\
    texturePressedUnchecked = UNCHECKED;\
    textureDisabledChecked = CHECKED;\
    textureDisabledUnchecked = UNCHECKED;

#define RGBATOHEX(COLOR_R,COLOR_G,COLOR_B,COLOR_A) __EVAL([COLOR_R,COLOR_G,COLOR_B,COLOR_A] call _fnc_colorRGBAtoHEX)
#define RGBTOHEX(COLOR_R,COLOR_G,COLOR_B) __EVAL([COLOR_R,COLOR_G,COLOR_B] call _fnc_colorRGBAtoHEX)
#define VARTOHEX __EVAL(_color call _fnc_colorRGBAtoHEX)

#define HEXTORGBA(COLOR_RGBA)\
    __EVAL(COLOR_RGBA call _fnc_colorHEXtoRGBA_2),\
    __EVAL(COLOR_RGBA call _fnc_colorHEXtoRGBA_4),\
    __EVAL(COLOR_RGBA call _fnc_colorHEXtoRGBA_6),\
    __EVAL(COLOR_RGBA call _fnc_colorHEXtoRGBA_0)

#define HEXTORGB(COLOR_RGB)\
    __EVAL(COLOR_RGB call _fnc_colorHEXtoRGBA_0),\
    __EVAL(COLOR_RGB call _fnc_colorHEXtoRGBA_2),\
    __EVAL(COLOR_RGB call _fnc_colorHEXtoRGBA_4)

#define RGBA255to1(COLOR_R,COLOR_G,COLOR_B,COLOR_A)\
    __EVAL(COLOR_R * 0.00392157),\
    __EVAL(COLOR_G * 0.00392157),\
    __EVAL(COLOR_B * 0.00392157),\
    __EVAL(COLOR_A * 0.00392157)

#include "macroExecs.hpp"
