#include "Main.h"

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
    vector<group> groups = sqf::all_groups();

    for (group grp : groups) {
        vector<object> grpUnits = sqf::units(grp);

        if (grpUnits.size() > 0) {
            object leader = sqf::leader(grp);
            vector3 leaderPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(leader));
            float leaderDistance = sqf::distance(leaderPos, (vector3)GETVAR(camPos, game_value(vector3{0, 0, 0})));

            if (sqf::alive(leader) && leaderDistance < 2000) {
                game_value rv_selection = sqf::get_variable(sqf::mission_namespace(), QGVAR(selection));
                vector<object> selection = game_value_to_object_vector(rv_selection);

                // Opacity
                float alpha = sqf::linear_conversion(0, 2000, leaderDistance, 1, 0, true);
                if (std::find(selection.begin(), selection.end(), leader) != selection.end()) alpha = 1.0f;

                // Color
                vector<float> color = {0.0f, 0.0f, 0.0f, 1.0f};
                color[3] = max(alpha, 0.2f);

                // Texture
                string texture = sqf::get_variable(grp, QGVAR(iconTexture), game_value(""));
                if (texture == "") {
                    game_value marker_texture;

                    __SQF(
                        ([([_this] call mars_common_getMarkerType)] call mars_common_getMarkerTexture)
                    ).capture(grp, marker_texture);

                    texture = marker_texture;
                    sqf::set_variable(grp, QGVAR(iconTexture), texture);
                }

                sqf::draw_icon_3d(
                    texture,
                    game_value(color),
                    leaderPos,
                    1,
                    1,
                    0,
                    "",
                    0,
                    0
                );
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