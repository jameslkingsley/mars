#include "Main.hpp"
//#include "Drawing.h"
//#include "Helpers.h"

using namespace intercept;
using namespace intercept::types;

int __cdecl intercept::api_version() {
    return 1;
}

//std::vector<object> units;

void __cdecl intercept::post_init() {
    //units = sqf::all_units();
}

void __cdecl intercept::on_frame() {
    //if (sqf::get_variable(sqf::mission_namespace(), "mars_editor_isSet", game_value(false))) {
        //std::vector<object> units = sqf::all_units();
        sqf::rv_color color = std::vector<game_value>{1.0f, 0.0f, 0.0f, 1.0f};
        vector3 unitPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(sqf::player()));
        sqf::draw_icon_3d("\\A3\\ui_f\\data\\igui\\cfg\\islandmap\\iconplayer_ca.paa", color, unitPos, 1.0f, 1.0f, 0.0f, "", 1.0f, 0.0f, "TahomaB");
        /*for (object unit : units) {
            sqf::rv_color color = std::vector<game_value>{1.0f, 0.0f, 0.0f, 1.0f};
            vector3 unitPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(unit));
            //vector3 playerPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(sqf::player()));
            //sqf::draw_line_3d(playerPos, unitPos, color);
            sqf::draw_icon_3d("\\A3\\ui_f\\data\\igui\\cfg\\islandmap\\iconplayer_ca.paa", color, unitPos, 1.0f, 1.0f, 0.0f, "", 1.0f, 0.0f, "TahomaB");
        }*/
        //Drawing::DrawIcons();
    //}
}

BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
    ) {
    switch (ul_reason_for_call) {
        case DLL_PROCESS_ATTACH:
            break;
        case DLL_THREAD_ATTACH:
        case DLL_THREAD_DETACH:
        case DLL_PROCESS_DETACH:
            break;
    }
    return TRUE;
}