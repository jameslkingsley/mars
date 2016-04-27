#include "Main.h"

using namespace std;
using namespace intercept;
using namespace intercept::types;

sqf::rv_color GetSideColor(const object& unit_) {
    side unitSide = sqf::get_side(sqf::get_group(unit_));

    switch (unitSide.operator int) {
        case SIDE_WEST:
        {
            return{0.0f,0.0f,0.0f,0.0f};
        }
        default:
            break;
    }
}

void __cdecl intercept::post_init() {}

void __cdecl intercept::on_frame() {
    vector<group> groups = sqf::all_groups();

    for (group grp : groups) {
        vector<object> grpUnits = sqf::units(grp);

        if (grpUnits.size() > 0) {
            object leader = sqf::leader(grp);
            vector3 leaderPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(leader));
            float leaderDistance = sqf::distance(leaderPos, (vector3)GETVAR(camPos, game_value(vector3{0, 0, 0})));

            if (sqf::alive(leader) && leaderDistance < 2000) {
                game_value selection = sqf::get_variable(sqf::mission_namespace(), QGVAR(selection));
                float alpha = sqf::linear_conversion(0, 2000, leaderDistance, 1, 0, true);
                GetSideColor(leader);
            }
        }
    }
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