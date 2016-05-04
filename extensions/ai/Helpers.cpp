#include "Helpers.hpp"

using namespace std;
using namespace intercept;

void Helpers::ExportConfig() {
    sqf::config_entry cfg_ai = sqf::config_entry(sqf::config_file()) >> QGVARMAIN(ai);
    vector<string> ai = sqf::config_classes("true", cfg_ai);

    for (string entry : ai) {

    }
}
