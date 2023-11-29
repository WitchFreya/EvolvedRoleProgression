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

private _dbName = format ["%1_%2", QGVARMAIN(data), _uid];
[_dbName] call FUNC(getDb);
