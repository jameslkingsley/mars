/*
 * Author: Kingsley
 * Spawns a virtual arsenal box
 * Must be executed on the server
 *
 * Arguments:
 * 0: Position <ARRAY>
 *
 * Return Value:
 * Spawned box <OBJECT>
 *
 * Example:
 * [] call mars_editor_fnc_spawnArsenal;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_pos", []]];

if (!isServer || {_pos isEqualTo []}) exitWith {};

private _box = "Land_PaperBox_open_full_F" createVehicle _pos;
_box allowDamage false;

["AmmoboxInit", [_box, true]] spawn BIS_fnc_arsenal;

_box
