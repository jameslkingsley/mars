#include "Main.hpp"

using namespace std;
using namespace intercept;

namespace Helpers {
    vector<object> GameValueToObjectVector(const game_value& array_);

    // Side Color
    sqf::rv_color GetSideColor(const side& side_);
    sqf::rv_color GetSideColor(const object& unit_);
    sqf::rv_color GetSideColor(const group& grp_);
}
