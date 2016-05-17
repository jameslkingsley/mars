/*
 * Author: Kingsley
 * Opens the accent picker
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

[] spawn {
    closeDialog 0;
    createDialog QGVAR(accent);
};