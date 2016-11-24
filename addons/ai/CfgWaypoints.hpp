class CfgWaypoints {
    class ADDON {
        displayName = QMODNAME;
        class Paradrop {
            displayName = "Infantry Paradrop";
            tooltip = "Paradrop infantry from vehicle. If no parachute is present an artificial one is given.";
            file = QPATHTOF(functions\fnc_wpParadrop.sqf);
            icon = "\A3\ui_f\data\map\vehicleicons\iconParachute_ca.paa";
        };
    };
};
