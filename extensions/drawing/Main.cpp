#include "Main.h"
#include "Drawing.h"

using namespace std;
using namespace intercept;

void __cdecl intercept::post_init() {}

void __cdecl intercept::on_frame() {
    Drawing::DrawIcons();
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