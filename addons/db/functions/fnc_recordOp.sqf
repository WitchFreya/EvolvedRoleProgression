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

try {
  private _now = call FUNC(realTime);
  {
    [_x, getPlayerUID _x, _x call EFUNC(roles,unitRole), _now] call FUNC(recordOpForUnit);
  } forEach ([] call BIS_fnc_listPlayers);
} catch {
  [["Something went wrong while saving"], ["Please report this error on GitHub and attach the RPT file"]] remoteExec ["CBA_fnc_notify", _whoSaved];
  private _message = format ["Something went wrong saving, save data can be found at profileNamespace:%1", QGVARMAIN(lastOpData)];
  ERROR_WITH_TITLE(_message,_exception);
  diag_log [_message,_exception,_players];
  profileNamespace setVariable [QGVARMAIN(lastOpData),_players];
};
