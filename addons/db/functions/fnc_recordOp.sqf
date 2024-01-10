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


private _players = [] call BIS_fnc_listPlayers;
private _now = call FUNC(realTime);
{
  private _uid /* string */ = getPlayerUID _x;
  private _role /* string */ = _x call EFUNC(roles,unitRole);
  private _mut_ops /* Date[] */ = [_x, _role] call EFUNC(history,opDates);
  _mut_ops pushBack _now;
  private _db = [_uid] call FUNC(getUnitDb);
  [_db, _role, "ops", _mut_ops] spawn EFUNC(db,write);
  private _history = [_x] call EFUNC(history,get);
  [QGVARMAIN(saved),[_history],_x] call CBA_fnc_targetEvent;
} forEach _players;
