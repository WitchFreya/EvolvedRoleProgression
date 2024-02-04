#include "script_component.hpp"

/*
 * Author: Maid
 * Records the current op role instance for a player.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Unit's UID <STRING>
 * 2: Unit's role class <STRING>
 * 3: The realtime from when op was saved <DATE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "012345678", "Rifleman", _date] call erp_db_fnc_recordOpForUnit
 *
 * Public: No
 */

params [
  ["_unit", objNull, [objNull]],
  ["_uid", "", [""]],
  ["_role", "", [""]],
  "_now"
];

TRACE_1("Recording up for unit",_unit);
private _mut_ops /* DATE[] */ = [_unit, _role] call EFUNC(history,opDates);
[QGVARMAIN(saveStart), [time, _role], _unit] call CBA_fnc_targetEvent;
_mut_ops pushBack _now;
private _db = [_uid] call FUNC(getUnitDb);
private _prevCount = [_unit, _role] call EFUNC(history,opCount);
if !([_db, _role, "ops", _mut_ops] call FUNC(write)) exitWith {
  throw "Unknown error occurred while calling write.";
};
[QGVARMAIN(saved), [_role, _prevCount + 1], _unit] call CBA_fnc_targetEvent;
