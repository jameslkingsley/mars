class GVARMAIN(context) {
    class ADDON {
        class Artillery {
            displayName = "Artillery";
            condition = QUOTE(\
                [EGVAR(editor,selection)] call FUNC(isArtillery) &&\
                {[EGVAR(editor,selection)] call CFUNC(isAllSameClass)}\
            );
            children = QFUNC(getAmmoTypeOptions);
        };
    };
};