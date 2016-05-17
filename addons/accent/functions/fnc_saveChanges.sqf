/*
 * Author: Kingsley
 * Save changes to the profile namespace
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

saveProfileNamespace;
closeDialog 0;

[] spawn {
    [] call EFUNC(editor,shutdown);
    sleep 0.1;
    [] call EFUNC(editor,openEditor);
};
