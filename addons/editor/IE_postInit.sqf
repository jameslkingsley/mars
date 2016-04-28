#include "script_component.hpp"

if (intercept_invoker_ok) then {
    MARS_LOGINFO("Intercept Post-Init...");
    _res = "intercept" callExtension "rv_event:post_init";
    MARS_LOGINFO("Intercept Post-Init Finished.");
    [] spawn {
        waitUntil {!isNull (findDisplay 46)};
        (findDisplay 46) displayAddEventHandler ["unload", { 
            _res = "intercept" callExtension "rv_event:mission_stopped";
        }];
    };
    addMissionEventHandler ["Ended", {
        _res = "intercept" callExtension "rv_event:mission_ended";
    }];
};