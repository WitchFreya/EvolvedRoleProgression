#include "script_component.hpp"

/*
 * Author: Maid
 * Bumps the playtime of all units.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [
  ["_whoSaved", objNull, [objNull]]
];

private _players = [] call BIS_fnc_listPlayers apply {
  [_x, getPlayerUID _x, _x call EFUNC(roles,unitRole)];
};

try {
  private _now = call FUNC(realTime);
  {
    _x params ["_unit", "_uid", "_role"];
    private _mut_ops /* Date[] */ = [_unit, _role] call EFUNC(history,opDates);
    [QGVARMAIN(saveStart),[time,_role,_mut_ops],_unit] call CBA_fnc_targetEvent;
    _mut_ops pushBack _now;
    private _db = [_uid] call FUNC(getUnitDb);
    [_db, _role, "ops", _mut_ops] call EFUNC(db,write);
    private _prevCount = [_unit, _role] call EFUNC(history,opCount);
    [QGVARMAIN(saved), [_role, _prevCount + 1], _unit] call CBA_fnc_targetEvent;
  } forEach _players;
} catch {
  [["Something went wrong while saving"], ["Please report this error on GitHub and attach the RPT file"]] remoteExec ["CBA_fnc_notify", _whoSaved];
  private _message = format ["Something went wrong saving, save data can be found at profileNamespace:%1", QGVARMAIN(lastOpData)];
  ERROR_WITH_TITLE(_message,_exception);
  diag_log [_message,_exception,_players];
  profileNamespace setVariable [QGVARMAIN(lastOpData),_players];
};
