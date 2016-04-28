#include "Main.h"
#include "Drawing.h"

using namespace std;
using namespace intercept;

/*sqf::rv_color GetSideColor(const object& unit_) {
    sqf::rv_color test{1.0f, 2.0f, 3.0f, 1.0f};
    side unitSide = sqf::get_side(sqf::get_group(unit_));

    switch (unitSide.operator int) {
        case SIDE_WEST:
        case SIDE_EAST:
        case SIDE_GUER:
        case SIDE_CIV:
        default:
            break;
    }
}*/

vector<object> game_value_to_object_vector(const game_value& array_) {
    vector<object> result;

    for (int i = 0; i < array_.length(); i++) {
        result.push_back(array_[i]);
    }

    return result;
}

void __cdecl intercept::post_init() {}

void __cdecl intercept::on_frame() {
    Drawing::DrawIcons();
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