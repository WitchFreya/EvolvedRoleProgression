#include "script_component.hpp"

/*
 * Author: Maid
 * Check if candidate is a valid cert for role.
 *
 * Arguments:
 * 0: role <STRING> - Role class name from cfgroles
 * 1: rank <STRING> - Rank class name from CfgRanks in CfgRoles.
 *
 * Return Value: True on success, false otherwise.
 *
 * Public: No
 */

params [
  ["_role", "", [""]],
  ["_rank", "", [""]]
];

if (_role == "" || {_rank == ""}) exitWith {
  ERROR_1("Invalid args",_this);
  false;
};

if !([_role] call FUNC(isValidRole)) exitWith {
  TRACE_1("Invalid role",_role);
  false;
};

private _cfg = configFile >> "CfgRoles" >> _role >> "CfgRanks" >> _rank;

if !(isClass _cfg) exitWith {
  TRACE_1("No config found for rank",_cfg);
  false;
};

true;
