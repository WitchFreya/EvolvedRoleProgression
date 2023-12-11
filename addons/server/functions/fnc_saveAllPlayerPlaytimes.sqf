#include "script_component.hpp"

/*
 * Author: Maid
 * Saves the role progress for all players on the server and updates their local variable.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _players = call BIS_fnc_listPlayers;
{
  [_x] spawn FUNC(saveUnitRolePlaytime);
} forEach _players;
{
  private _history = [getPlayerUID _x] call FUNC(buildHistoryForUID);
  player setVariable [QGVARMAIN(history),_history,true];
} forEach _players;
