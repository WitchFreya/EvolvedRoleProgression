#include "script_component.hpp"

/*
 * Author: Maid
 * Get the icon for a role's rank.
 *
 * Arguments:
 * 0: Role <STRING> - Role from CfgRoles;
 * 1: Rank <STRING> - Rank from a Role's CfgRanks
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

private _default = QPATHTOEF(common,data\sws_icon_howl_ca.paa);

private _cfg = configFile >> "CfgRoles" >> _role >> "CfgRanks" >> _rank;

[_cfg, "icon", _default] call BIS_fnc_returnConfigEntry;
