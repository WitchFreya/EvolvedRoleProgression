#include "script_component.hpp"

/*
 * Author: Maid
 * Change a unit's certification rank.
 *
 * Arguments:
 * 0: db <INIDBI2> - The db to write
 * 1: role <STRING> - Role class name from cfgroles
 * 2: rank <STRING> - Rank from CfgRank in the role.
 *
 * Return Value: True on success, false otherwise.
 *
 * Public: No
 */

params [
  ["_db", FUNC(noop), [{}]],
  ["_role", "", [""]],
  ["_rank", "", [""]]
];

ASSERT_DB(_db,"Invalid db",false);

if (_role == "" || {_rank == ""}) exitWith {
  ERROR_1("Invalid args"_this);
  false;
};

if !([_role, _rank] call EFUNC(roles,isValidRank)) exitWith {
  ERROR_2("Rank could not be changed",_role,_rank);
  TRACE_2("CfgRole entry for CfgRank probably does not exist",_role,_rank);
  false;
};

[_db, _role, "rank", _rank] call FUNC(write);
