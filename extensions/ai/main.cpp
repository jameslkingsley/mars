#include "main.h"
#include "Helpers.h"

using namespace intercept;

void __cdecl intercept::post_init() {
    Helpers::ExportConfig();
}

void __cdecl intercept::on_frame() {
    float frame = sqf::diag_frameno();
}

BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
    ) {
    switch (ul_reason_for_call) {
        case DLL_PROCESS_ATTACH:
            break;
        case DLL_THREAD_ATTACH:
        case DLL_THREAD_DETACH:
        case DLL_PROCESS_DETACH:
            break;
    }
    return TRUE;
}