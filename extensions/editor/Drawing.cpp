#include "Helpers.h"
#include "Drawing.h"

using namespace std;
using namespace intercept;

namespace Drawing {
    void DrawIcons() {
#define ICON_HEIGHT_ABOVE_LEADER 5
#define PLAYER_SELECT_ICON "\\A3\\ui_f\\data\\igui\\cfg\\islandmap\\iconplayer_ca.paa"

        vector<group> groups = sqf::all_groups();
        //vector3 camPos = (vector3)GETVAR(camPos, game_value(vector3{0, 0, 0}));
        vector3 camPos = sqf::get_variable(sqf::mission_namespace(), "mars_editor_camPos", game_value(vector3{0, 0, 0}));

        for (group grp : groups) {
            vector<object> grpUnits = sqf::units(grp);

            if (grpUnits.size() > 0) {
                object leader = sqf::leader(grp);
                vector3 leaderPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(leader));
                float leaderDistance = sqf::distance(leaderPos, camPos);

                if (sqf::alive(leader) && leaderDistance < ICON_FADE_DISTANCE) {
                    game_value rv_selection = sqf::get_variable(sqf::mission_namespace(), "mars_editor_selection");
                    vector<object> selection = Helpers::GameValueToObjectVector(rv_selection);

                    // Opacity
                    float alpha = sqf::linear_conversion(0.0f, ICON_FADE_DISTANCE, leaderDistance, 1.0f, 0.0f, true);
                    //if (find(selection.begin(), selection.end(), leader) != selection.end()) alpha = 1.0f;

                    // Color
                    sqf::rv_color color = Helpers::GetSideColor(grp);
                    color.alpha = max(alpha, 0.2f);

                    // Texture
                    /*game_value texture = sqf::get_variable(grp, "mars_editor_iconTexture", game_value(""));
                    if (texture.length() <= 0) {
                        game_value marker_texture;

                        __SQF(
                            ([([_this] call mars_common_getMarkerType)] call mars_common_getMarkerTexture)
                        ).capture(grp, marker_texture);

                        texture = marker_texture;
                        sqf::set_variable(grp, "mars_editor_iconTexture", texture);
                    }*/

                    vector3 aboveLeaderPos = {
                        leaderPos.x,
                        leaderPos.y,
                        leaderPos.z + ICON_HEIGHT_ABOVE_LEADER
                    };

                    // Draw Icon 3D
                    sqf::draw_icon_3d(PLAYER_SELECT_ICON, color, aboveLeaderPos, 1, 1, 0, "", 0, 0);

                    // Draw Line 3D
                    sqf::rv_color fadedBlack = vector<game_value>{0.0f, 0.0f, 0.0f, alpha};
                    sqf::draw_line_3d(leaderPos, aboveLeaderPos, fadedBlack);
                }

                for (object unit : grpUnits) {
                    if (!sqf::alive(unit)) continue;
                    vector3 unitPos = sqf::asl_to_agl(sqf::get_pos_asl_visual(unit));
                    float unitDistance = sqf::distance(unit, camPos);
                    if (unitDistance > BOX_FADE_DISTANCE) continue;

                    // Opacity
                    float alpha = sqf::linear_conversion(0.0f, BOX_FADE_DISTANCE, unitDistance, 1.0f, 0.0f, true);

                    // Color
                    sqf::rv_color color = Helpers::GetSideColor(unit);
                    color.alpha = max(alpha, 0.2f);

                    // Texture
                    game_value texture = sqf::get_variable(grp, "mars_editor_iconTexture", game_value(""));
                    if (texture.length() <= 0) {
                        string icon_name = sqf::get_text(sqf::config_entry(sqf::config_file()) >> "CfgVehicles" >> sqf::type_of(unit) >> "icon");
                        string icon_texture = sqf::get_text(sqf::config_entry(sqf::config_file()) >> "CfgVehicleIcons" >> icon_name);
                        texture = icon_texture;
                        sqf::set_variable(grp, "mars_editor_iconTexture", texture);
                    }

                    if (sqf::is_player(unit)) {
                        sqf::rv_color selColor = vector<game_value>{0.0f, 0.0f, 0.0f, alpha};
                        if (sqf::alive(unit)) {
                            if (sqf::local(unit)) {
                                selColor.red = 1.0f;
                            } else {
                                selColor.red = 1.0f;
                                selColor.blue = 0.5f;
                            }
                        }

                        // Draw Icon 3D
                        sqf::draw_icon_3d(PLAYER_SELECT_ICON, selColor, unitPos, 1, 1, 0, "", 1, 0);
                    }

                    if (sqf::alive(unit)) {
                        // Draw Icon 3D
                        sqf::draw_icon_3d(texture, color, unitPos, 1, 1, 0, "", 1, 0);

                        // Draw Line 3D
                        vector3 aboveUnitPos = {
                            unitPos.x,
                            unitPos.y,
                            unitPos.z + 1
                        };

                        vector3 aboveLeaderPos = {
                            leaderPos.x,
                            leaderPos.y,
                            leaderPos.z + 1
                        };

                        sqf::draw_line_3d(aboveUnitPos, aboveLeaderPos, color);
                    }
                }
            }
        }
    }
}