#include "Helpers.hpp"

using namespace std;
using namespace intercept;

namespace Helpers {
    vector<object> GameValueToObjectVector(const game_value& array_) {
        vector<object> result;

        for (int i = 0; i < array_.length(); i++) {
            result.push_back(array_[i]);
        }

        return result;
    }

#define GET_SIDE_COLOR_SWITCH \
    case SIDE_WEST:\
        return vector<game_value>{RGBA_WEST};\
    case SIDE_EAST:\
        return vector<game_value>{RGBA_EAST};\
    case SIDE_GUER:\
        return vector<game_value>{RGBA_GUER};\
    case SIDE_CIV:\
        return vector<game_value>{RGBA_CIV};\
    default:\
        return vector<game_value>{0.0f, 0.0f, 0.0f, 1.0f};

    sqf::rv_color GetSideColor(const side& side_) {
        switch (int(side_)) {
            GET_SIDE_COLOR_SWITCH
        }
    }

    sqf::rv_color GetSideColor(const object& unit_) {
        side unitSide = sqf::get_side(sqf::get_group(unit_));
        switch (int(unitSide)) {
            GET_SIDE_COLOR_SWITCH
        }
    }

    sqf::rv_color GetSideColor(const group& grp_) {
        side grpSide = sqf::get_side(grp_);
        switch (int(grpSide)) {
            GET_SIDE_COLOR_SWITCH
        }
    }

    vector3 CursorWorldPos() {
        return sqf::screen_to_world(sqf::get_variable(sqf::mission_namespace(), "mars_editor_mousePos", game_value(vector2{0, 0})));
    }
}