#include "script_component.hpp"

/*
 * Author: Maid
 * Get the description for a role.
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

private _default = "Something is wrong with this role's config. Please report this error.";

ASSERT_FALSE_EXIT(_role == "","Invalid arguments",_default);

private _cfg = configFile >> "CfgRoles" >> _role;

private _description = (_cfg >> "description") call BIS_fnc_getCfgData;

ASSERT_FALSE_EXIT(isNil {_description},"Invalid description for role",_default);

_description;
