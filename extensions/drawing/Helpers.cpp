#include "Helpers.h"

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
};