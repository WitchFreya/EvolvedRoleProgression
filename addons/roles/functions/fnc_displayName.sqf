#include "script_component.hpp"

/*
 * Author: Maid
 * Get the display name for a role.
 *
 * Arguments:
 * 0: Role <STRING> - Role from CfgRoles;
 *
 * Return Value:
 * STRING
 *
 * Public: No
 */

params [
  ["_role", "", [""]]
];

ASSERT_FALSE_EXIT(_role == "","Invalid arguments","Unknown Role");

private _cfg = configFile >> "CfgRoles" >> _role;

[_cfg, "displayName", configName _cfg] call BIS_fnc_returnConfigEntry;
