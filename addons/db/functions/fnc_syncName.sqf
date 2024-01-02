#include "script_component.hpp"

/*
 * Author: Maid
 * Saves the role progress to the database. Should only run on the server.
 *
 * Arguments:
 * 0: Player UID <STRING>
 * 1: Player in-game profile name <STRING>
 *
 * Return Value:
 * true if is write was successfull, false if not
 *
 * Public: No
 */

params [
  ["_uid", "", [""]],
  ["_name", "", [""]]
];

private _db = [_uid] call FUNC(getUnitDb);
private _storedName = [_db, "$metadata", "playerName"] call FUNC(read);
if (_storedName == _name) exitWith {TRACE_1("Name identical, staying",_name);};
[_db, "$metadata", "playerName", _name] call FUNC(write);
[call FUNC(getCoreDb), _uid, "name", _name] call FUNC(write);
