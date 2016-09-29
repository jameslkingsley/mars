class GVARMAIN(toolbar) {
    class ADDON {
        class EditPlayers {
            default = 0;
            tooltipText = "Edit players";
            iconOn = QPATHTOF(data\Toolbar\player_on_ca.paa);
            iconOff = QPATHTOF(data\Toolbar\player_off_ca.paa);
            action = QFUNC(toggleEditPlayers);
        };
        class NightVision {
            default = 0;
            tooltipText = "Night Vision";
            iconOn = QPATHTOF(data\Toolbar\vision_nvg_ca.paa);
            iconOff = QPATHTOF(data\Toolbar\vision_normal_ca.paa);
            action = QFUNC(toggleNightVision);
            watch = QGVAR(nightVisionEnabled);
        };
        class VehicleCrew {
            default = QGVAR(placeVehiclesWithCrew);
            tooltipText = "Place vehicles with crew";
            iconOn = QPATHTOF(data\Toolbar\vision_nvg_ca.paa);
            iconOff = QPATHTOF(data\Toolbar\vision_normal_ca.paa);
            action = QUOTE(\
                params [[ARR_2('_enabled', false)]];\
                GVAR(placeVehiclesWithCrew) = _enabled;\
            );
        };
    };
};
