#include "Main.h"
#include "Drawing.h"

using namespace std;
using namespace intercept;

int __cdecl intercept::api_version() {
    return 1;
}

void __cdecl intercept::post_init() {
    sqf::system_chat("mars_drawing.dll postInit...");
}

void __cdecl intercept::on_frame() {
    bool editorIsOpen = (bool)GETVAR(isSet, game_value(false));
    if (editorIsOpen) {
        sqf::system_chat("Editor is open");
        Drawing::DrawIcons();
    } else {
        sqf::system_chat("Editor is closed");
    }
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