#pragma once

struct ResourceTree {
    struct head {
        struct sight {
            struct angleToTarget {
                float x;
                float y;
                float z;
            };
        };
        struct hearing {
            float intensity;
            float distance;
            struct angleToSource {
                float x;
                float y;
                float z;
            };
        };
    };
    struct torso {
        float direction;
    };
    struct arms {};
    struct legs {};
};