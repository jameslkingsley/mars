#include "Helpers.hpp"
#include "Vector.hpp"
#include "Drawing.hpp"

using namespace std;
using namespace intercept;
using namespace intercept::types;

namespace Drawing {
    void CreateTerrainLine(const vector3& start_, const vector3& end_, sqf::rv_color& color_) {
        float _meters = ceil(sqf::distance(start_, end_));
        vector3 _iterationPos = start_;

        for (int i = 1; i != _meters; i++) {
            float _currentDistance = ceil(sqf::distance(_iterationPos, end_));
            vector3 _iEndPos = Vector::Add(_iterationPos, Vector::Normalize(Vector::Diff(end_, _iterationPos)));

            _iterationPos.z = 5;
            _iEndPos.z = (_currentDistance == 0) ? end_.z : 5;

            sqf::draw_line_3d(_iterationPos, _iEndPos, color_);

            _iterationPos = _iEndPos;
        }

        sqf::draw_line_3d(_iterationPos, end_, color_);
    }
}