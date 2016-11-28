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
        class IconCallsigns {
            default = QGVAR(showGroupIconCallsigns);
            tooltipText = "Show group icon callsigns";
            iconOn = QPATHTOF(data\Toolbar\a_on_ca.paa);
            iconOff = QPATHTOF(data\Toolbar\a_off_ca.paa);
            action = QUOTE(\
                params [[ARR_2('_enabled', false)]];\
                GVAR(showGroupIconCallsigns) = _enabled;\
                [ARR_2(QQGVAR(showGroupIconCallsigns), _enabled)] call CFUNC(saveSetting);\
            );
        };
        class MapMarkers3D {
            default = QGVAR(showMapMarkers3D);
            tooltipText = "Show map markers in 3D";
            iconOn = QPATHTOF(data\Toolbar\marker_on_ca.paa);
            iconOff = QPATHTOF(data\Toolbar\marker_off_ca.paa);
            action = QUOTE(\
                params [[ARR_2('_enabled', false)]];\
                GVAR(showMapMarkers3D) = _enabled;\
                [ARR_2(QQGVAR(showMapMarkers3D), _enabled)] call CFUNC(saveSetting);\
            );
        };
        /*class DebugPanel {
            default = QGVAR(showDebugPanel);
            tooltipText = "Show debug panel";
            iconOn = QPATHTOF(data\Toolbar\debug_on_ca.paa);
            iconOff = QPATHTOF(data\Toolbar\debug_off_ca.paa);
            action = QUOTE(\
                params [[ARR_2('_enabled', false)]];\
                GVAR(showDebugPanel) = _enabled;\
                [ARR_2(QQGVAR(showDebugPanel), _enabled)] call CFUNC(saveSetting);\
            );
        };*/
    };
};
