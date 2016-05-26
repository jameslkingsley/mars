class GVARMAIN(toolbar) {
    class ADDON {
        class environment {
            default = false;
            toggle = false;
            tooltipText = CSTRING(Toolbar_Tooltip);
            iconOn = QUOTE(PATHTOF(data\environment_ca.paa));
            iconOff = QUOTE(PATHTOF(data\environment_ca.paa));
            action = QUOTE([ARR_2(QUOTE(QUOTE(ADDON)), 'environment')] call EFUNC(attributes,openAttributes));
        };
    };
};