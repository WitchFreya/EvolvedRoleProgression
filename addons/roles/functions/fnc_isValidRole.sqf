#include "script_component.hpp"

/*
 * Author: Maid
 * Check if role is valid for use.
 *
 * Arguments:
 * 0: role <STRING> - Hopefully a role class name from CfgRoles.
 *
 * Return Value: True on success, false otherwise.
 *
 * Public: No
 */

params [
  ["_role", "", [""]]
];

if (_role == "") exitWith {
  ERROR_1("Invalid args",_this);
  false;
};

private _cfg = configFile >> "CfgRoles" >> _role;
private _scope = (_cfg >> "scope") call BIS_fnc_getCfgData;

if (isNil {_scope}) exitWith {
  TRACE_1("No config found",_cfg);
  false;
};

if (_scope != 2) exitWith {
  TRACE_1("Config found, but invalid scope",_scope);
  false;
};

private _isOurs = _role isKindOf [QUOTE(BASE_ROLE),configFile >> "CfgRoles"];

if !(_isOurs) exitWith {
  TRACE_2("Config found, but does not extend base role",_role,QUOTE(BASE_ROLE));
  false;
};

true;
