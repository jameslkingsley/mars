#pragma once

#include "Main.h"

using namespace std;

struct Job {
    string functions;
    float priority;
    vector<tuple<string, float, float>> conditions;
    vector<vector<tuple<float, string, vector<tuple<string, float, float>>>>> profiles;
};

class Helpers {
public:
    static void ExportConfig();
};