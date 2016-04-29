#include "Common.h"

using namespace std;
using namespace intercept;

int __cdecl intercept::api_version() {
    return 1;
}

void __cdecl intercept::post_init() {}

void __cdecl intercept::on_frame() {}

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