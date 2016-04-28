#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"mars_common"};
        author[] = {"ACE3 Project","Kingsley"};
        authorUrl = "https://github.com/jameslkingsley/mars";
        VERSION_CONFIG;
    };
};

#define EVENT_ARGS(x) rv_event:##x
#define EH_CLASS_DEF(x,y) class Extended_##y##_EventHandlers { \
    class All { \
        class Intercept { \
            y = QUOTE(intercept_params_var set[ARR_2(0,_this)]; 'intercept' callExtension QUOTE(QUOTE(EVENT_ARGS(x)));); \
        }; \
    }; \
};

EH_CLASS_DEF(anim_changed,animChanged);
EH_CLASS_DEF(anim_done,animDone);
EH_CLASS_DEF(anim_state_changed,animStateChanged);
EH_CLASS_DEF(container_closed,containerClosed);
EH_CLASS_DEF(container_opened,containerOpened);
EH_CLASS_DEF(controls_shifted,controlsShifted);
EH_CLASS_DEF(dammaged,dammaged);
EH_CLASS_DEF(engine,engine);
EH_CLASS_DEF(epe_contact,epeContact);
EH_CLASS_DEF(epe_contact_end,epeContactEnd);
EH_CLASS_DEF(epe_contact_start,epeContactStart);
EH_CLASS_DEF(explosion,explosion);
EH_CLASS_DEF(fired,firedBIS);
EH_CLASS_DEF(fired_near,firedNear);
EH_CLASS_DEF(fuel,fuel);
EH_CLASS_DEF(gear,gear);
EH_CLASS_DEF(get_in,getIn);
EH_CLASS_DEF(get_out,getOut);
EH_CLASS_DEF(handle_heal,handleHeal);
EH_CLASS_DEF(hit,hit);
EH_CLASS_DEF(hit_part,hitPart);
EH_CLASS_DEF(init,init);
EH_CLASS_DEF(incoming_missile,incomingMissile);
EH_CLASS_DEF(inventory_closed,inventoryClosed);
EH_CLASS_DEF(inventory_opened,inventoryOpened);
EH_CLASS_DEF(killed,killed);
EH_CLASS_DEF(landed_touch_down,landedTouchDown);
EH_CLASS_DEF(landed_stopped,landedStopped);
EH_CLASS_DEF(local,local);
EH_CLASS_DEF(put,put);
EH_CLASS_DEF(respawn,respawn);
EH_CLASS_DEF(seat_switched,seatSwitched);
EH_CLASS_DEF(sound_played,soundPlayed);
EH_CLASS_DEF(take,take);
EH_CLASS_DEF(weapon_assembled,weaponAssembled);
EH_CLASS_DEF(weapon_disassembled,weaponDisassembled);

class CfgFunctions {
    class Intercept {
        class boot {
            class boot_loader {
                preStart = 1;
                file = QUOTE(PATHTOF(IE_boot.sqf));
                headerType = -1;
            };
        };
        class initialization {
            class lib_loader {
                preInit = 1;
                file = QUOTE(PATHTOF(IE_lib.sqf));
                headerType = -1;
            };
            class post_init_handler {
                postInit = 1;
                file = QUOTE(PATHTOF(IE_postInit.sqf));
                headerType = -1;
            };
        };
        class api {
            class signal {
                file = QUOTE(PATHTOF(IE_signal.sqf));
                headerType = -1;
            };
        };
    };
};

class Intercept {
    class GVARMAIN(intercept) {
        class ADDON {
            pluginName = "mars_drawing";
        };
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\interface.hpp"
#include "CfgContext.hpp"
#include "CfgToolbar.hpp"
#include "CfgAssetBrowser.hpp"
