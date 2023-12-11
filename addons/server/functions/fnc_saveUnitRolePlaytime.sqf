#include "script_component.hpp"

/*
 * Author: Maid
 * Saves the role progress to the database. Should only run on the server.
 *
 * Arguments:
 * 0: Player UID <STRING>
 * 1: Player in-game profile name <STRING>
 * 2: Role <STRING> (default: QUOTE(DEFAULT_ROLE))
 *
 * Return Value:
 * true if is write was successfull, false if not
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

private _db = [_unit] call EFUNC(db,getUnitDb);
private _name = name _unit;
private _role = _unit getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];
private _ops = _unit getVariable [QGVARMAIN(history), createHashMap]
  getOrDefault [_role, createHashMap]
  getOrDefault ["ops", []];

_ops pushBack ("getTimestamp" call _db);

[getPlayerUID _unit, _name] spawn EFUNC(db,syncName);
[_db, _role, "ops", _ops] call EFUNC(db,write);
