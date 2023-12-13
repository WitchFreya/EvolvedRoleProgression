#include "script_component.hpp"

/*
 * Author: Maid
 * Get the icon for a role.
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

private _default = QPATHTOEF(common,data\sws_icon_howl_ca.paa);

ASSERT_FALSE_EXIT(_role == "","Invalid arguments",_default);

private _cfg = configFile >> "CfgRoles" >> _role;

[_cfg, "icon", _default] call BIS_fnc_returnConfigEntry;
