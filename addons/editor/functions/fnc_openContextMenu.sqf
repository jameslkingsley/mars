/*
 * Author: Kingsley
 * Opens the context menu and builds the list from the config
 *
 * Arguments:
 * 0: Selection <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unitOne, unitTwo, unitThree]] call mars_editor_fnc_openContextMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

// configfile >> "MARS_Context" >> "mars_ai" >> "mars_ai_patrolArea"

_sections = "true" configClasses (configFile >> GVARMAIN(context));
MARS_LOGINFO(str _sections);

{
    _options = "true" configClasses (_x);
    MARS_LOGINFO(str _options);
    
    
    
    false
} count _sections;