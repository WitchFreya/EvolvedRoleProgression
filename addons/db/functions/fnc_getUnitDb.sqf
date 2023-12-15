#include "script_component.hpp"

/*
 * Author: Maid
 * Get the DB for a player
 *
 * Arguments:
 * 0: Player UID or Unit <STRING|OBJECT>
 *
 * Return Value:
 * DB Instance <INIDBI2>
 *
 * Public: No
 */

params [
  ["_uidOrUnit", objNull, [objNull, ""]]
];

TRACE_1("_uidOrUnit",_uidOrUnit);
private _uid = if (IS_OBJECT(_uidOrUnit)) then {getPlayerUID _uidOrUnit} else {_uidOrUnit};
TRACE_1("UId",IS_OBJECT(_uidOrUnit));

if (_uid == "") exitWith {
  ERROR("UID cannot be empty");
  FUNCMAIN(noop);
};

private _dbNameFormat = QUOTE(DOUBLES(GVARMAIN(data),%1));

switch (_uid) do {
  case "": {
    ERROR("UID cannot be empty");
    FUNCMAIN(noop);
  };
  case "_SP_AI_": {
    ERROR("Role history for AI is not suppported");
    FUNCMAIN(noop);
  };
  case "_SP_PLAYER_": {
    TRACE_1("Retrieving singleplayer for unit",_uid);
    [format [_dbNameFormat,"SINGLEPLAYER"]] call FUNC(getDb);
  };
  default {
    [format [_dbNameFormat, _uid]] call FUNC(getDb);
  }
};
