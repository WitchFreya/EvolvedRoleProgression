#include "script_component.hpp"

/*
 * Author: Maid
 * Get the DB for a player
 *
 * Arguments:
 * 0: Player UID <STRING>
 *
 * Return Value:
 * DB Instance <INIDBI2>
 *
 * Public: No
 */

params [
  ["_uid", "", [""]]
];

private _dbNameFormat = QUOTE(DOUBLES(GVARMAIN(data),%1));

switch (_uid) do {
  case "": {
    throw "UID cannot be empty";
  };
  case "_SP_AI_": {
    throw "Role history for AI is not suppported";
  };
  case "_SP_PLAYER_": {
    TRACE_1("Retrieving singleplayer for unit",_uid);
    [format [_dbNameFormat, "SINGLEPLAYER"]] call FUNC(getDb);
  };
  default {
    [format [_dbNameFormat, _uid]] call FUNC(getDb);
  };
};
