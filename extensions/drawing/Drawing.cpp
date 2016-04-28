#include "Helpers.h"
#include "Drawing.h"

using namespace std;
using namespace intercept;

namespace Drawing {
    void DrawIcons() {
        vector<group> groups = sqf::all_groups();

        for (group grp : groups) {
            vector<object> grpUnits = sqf::units(grp);

            if (grpUnits.size() > 0) {
                object leader = sqf::leader(grp);
                vector3 leaderPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(leader));
                float leaderDistance = sqf::distance(leaderPos, (vector3)GETVAR(camPos, game_value(vector3{0, 0, 0})));

                if (sqf::alive(leader) && leaderDistance < 2000) {
                    game_value rv_selection = sqf::get_variable(sqf::mission_namespace(), QGVAR(selection));
                    vector<object> selection = Helpers::GameValueToObjectVector(rv_selection);

                    // Opacity
                    float alpha = sqf::linear_conversion(0, 2000, leaderDistance, 1, 0, true);
                    if (std::find(selection.begin(), selection.end(), leader) != selection.end()) alpha = 1.0f;

                    // Color
                    vector<float> color = {0.0f, 0.0f, 0.0f, 1.0f};
                    color[3] = max(alpha, 0.2f);

                    // Texture
                    game_value texture = sqf::get_variable(grp, QGVAR(iconTexture), game_value(""));
                    if (texture.length() <= 0) {
                        game_value marker_texture;

                        __SQF(
                            ([([_this] call mars_common_getMarkerType)] call mars_common_getMarkerTexture)
                        ).capture(grp, marker_texture);

                        texture = marker_texture;
                        sqf::set_variable(grp, QGVAR(iconTexture), texture);
                    }
                }
            }
        }
    }
}