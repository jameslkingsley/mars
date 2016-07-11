#include "Main.hpp"
#include "Drawing.hpp"
#include "Helpers.hpp"

using namespace intercept;
using namespace intercept::types;

int __cdecl intercept::api_version() {
    return 1;
}

void __cdecl intercept::post_init() {
}

void __cdecl intercept::on_frame() {
    sqf::rv_color _color = vector<game_value>{1.0f, 0.0f, 0.0f, 1.0f};
    Drawing::CreateTerrainLine(sqf::asl_to_agl(sqf::get_pos_asl(sqf::player())), Helpers::CursorWorldPos(), _color);
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