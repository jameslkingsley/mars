class GVARMAIN(toolbar) {
    class ADDON {
        class environment {
            default = false;
            toggle = false;
            tooltipText = CSTRING(Toolbar_Tooltip);
            iconOn = QPATHTOF(data\environment_ca.paa);
            iconOff = QPATHTOF(data\environment_ca.paa);
            action = QUOTE([ARR_2(QUOTE(QUOTE(ADDON)), 'environment')] call EFUNC(attributes,openAttributes));
        };
    };
};