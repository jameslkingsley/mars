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

// #define SIZEEX_PURISTA(SIZEPX) __EVAL([SIZEPX,1.8,[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,37,46]] call _fnc_sizeEx)
// #define SIZEEX_ETELKA(SIZEPX) __EVAL([SIZEPX,1.55,[6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,37,46]] call _fnc_sizeEx)
// #define SIZEEX_TAHOMA(SIZEPX) __EVAL([SIZEPX,1.6,[16]] call _fnc_sizeEx)
// #define SIZEEX_LUCIDA(SIZEPX) __EVAL([SIZEPX,1.6,[8,11]] call _fnc_sizeEx)

#define SIZEEX_PURISTA_XS (2.88 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_PURISTA_S (3.96 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_PURISTA_M (4.32 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_PURISTA_L (4.68 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_PURISTA_XL (5.76 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_PURISTA_XS (2.88 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_PURISTA_S (3.96 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_PURISTA_M (4.68 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_PURISTA_L (4.68 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_PURISTA_XL (5.76 * (1 / (getResolution select 3)) * 1.25 * 4)

#define SIZEEX_ETELKA_XS (2.79 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_ETELKA_S (3.72 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_ETELKA_M (4.34 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_ETELKA_L (4.96 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_ETELKA_XL (5.89 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_ETELKA_XS (2.79 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_ETELKA_S (3.72 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_ETELKA_M (4.96 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_ETELKA_L (4.96 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_ETELKA_XL (5.89 * (1 / (getResolution select 3)) * 1.25 * 4)

#define SIZEEX_TAHOMA_XS (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_TAHOMA_S (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_TAHOMA_M (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_TAHOMA_L (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_TAHOMA_XL (5.12 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_TAHOMA_XS (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_TAHOMA_S (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_TAHOMA_M (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_TAHOMA_L (3.2 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_TAHOMA_XL (5.12 * (1 / (getResolution select 3)) * 1.25 * 4)

#define SIZEEX_LUCIDA_XS (2.56 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_LUCIDA_S (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_LUCIDA_M (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_LUCIDA_L (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZEEX_LUCIDA_XL (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_LUCIDA_XS (2.56 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_LUCIDA_S (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_LUCIDA_M (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_LUCIDA_L (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)
#define SIZE_LUCIDA_XL (3.52 * (1 / (getResolution select 3)) * 1.25 * 4)

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

#define COLOR_HIGHLIGHT_RGB	0,1,1
#define COLOR_HIGHLIGHT_RGBA COLOR_HIGHLIGHT_RGB,1

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
