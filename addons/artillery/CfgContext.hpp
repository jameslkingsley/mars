class GVARMAIN(context) {
    class ADDON {
        class Artillery {
            displayName = CSTRING(Name);
            exceptions[] = {"allSameClass", "vehicleHasAmmo", "isArtillery"};
            children = QFUNC(getAmmoTypeOptions);
        };
    };
};
