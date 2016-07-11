#include "Helpers.hpp"

using namespace std;
using namespace intercept;

namespace Vector {
    float Length(const vector3& vector_) {
        return sqrt(vector_.x * vector_.x + vector_.y * vector_.y + vector_.z * vector_.z);
    }

    vector3 Add(const vector3& start_, const vector3& end_) {
        return vector3{
            start_.x + end_.x,
            start_.y + end_.y,
            start_.z + end_.z
        };
    }

    vector3 Normalize(const vector3& vector_) {
        vector3 _vector = vector_;
        float length = Length(vector_);

        if (length != 0) {
            _vector.x = vector_.x / length;
            _vector.y = vector_.y / length;
            _vector.z = vector_.z / length;
        }

        return _vector;
    }

    vector3 Diff(const vector3& start_, const vector3& end_) {
        return vector3{
            end_.x - start_.x,
            end_.y - start_.y,
            end_.z - start_.z
        };
    }
}