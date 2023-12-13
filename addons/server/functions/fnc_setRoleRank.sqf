#include "script_component.hpp"

/*
 * Author: Maid
 * Change a unit's rank.
 *
 * Arguments:
 * 0: uid <STRING> - The UID of a player as returned by getPlayerUID
 * 1: role <STRING> - Role class name from cfgroles
 * 2: rank <STRING> - Rank class name from CfgRanks in CfgRoles >> _role >> CfgRanks
 *
 * Return Value: True on success, false otherwise.
 *
 * Public: No
 */

params [
  ["_uid", "", [""]],
  ["_role", "", [""]],
  ["_rank", "", [""]]
];

private _db = [_uid] call EFUNC(db,getUnitDb);

[_db, _role, _rank] call EFUNC(db,writeRank);
