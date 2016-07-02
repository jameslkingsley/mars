class GVARMAIN(modules) {
    class ADDON {
        displayName = CSTRING(Name);
        
        class PopulateArea {
            displayName = CSTRING(PopulateArea_Name);
            tooltipText = CSTRING(PopulateArea_Tooltip);
            icon = QPATHTOF(data\populatearea_ca.paa);
            action = QFUNC(openPopulateArea);
        };
    };
};