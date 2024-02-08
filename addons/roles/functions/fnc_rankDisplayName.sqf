#include "script_component.hpp"

/*
 * Author: Maid
 * Get the display name for a role's rank.
 *
 * Arguments:
 * 0: Role <STRING> - Role from CfgRoles;
 * 1: Rank <STRING> - Rank from CfgRoles' role CfgRanks
 *
 * Return Value:
 * STRING
 *
 * Public: No
 */

params [
  ["_role", "", [""]],
  ["_rank", "", [""]]
];

private _cfg = configFile >> "CfgRoles" >> _role >> "CfgRanks" >> _rank;

[_cfg, "displayName", configName _cfg] call BIS_fnc_returnConfigEntry;
