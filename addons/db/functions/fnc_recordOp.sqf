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
  private _uid = getPlayerUID _x;
  private _role = _x call EFUNC(roles,unitRole);
  private _ops = [_x, _role] call EFUNC(history,ops);
  _ops pushBack _now;
  private _db = [_uid] call FUNC(getUnitDb);
  [_db, _role, "ops", _ops] spawn EFUNC(db,write);
  private _history = [_x] call EFUNC(history,get);
  [QGVARMAIN(saved),[_history],_x] call CBA_fnc_targetEvent;
} forEach _players;
