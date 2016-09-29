class GVARMAIN(toolbar) {
    class ADDON {
        class environment {
            default = 0;
            toggle = 0;
            tooltipText = CSTRING(Toolbar_Tooltip);
            iconOn = QPATHTOF(data\environment_ca.paa);
            iconOff = QPATHTOF(data\environment_ca.paa);
            action = QUOTE([ARR_3(QUOTE(QUOTE(ADDON)), 'environment', [ARR_2(nil, 120)])] call AFUNC(openAttributes));
        };
    };
};