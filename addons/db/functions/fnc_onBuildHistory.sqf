#include "script_component.hpp"

/*
 * Author: Maid
 * Handle the buildHistory request event.
 *
 * Arguments:
 * 0: uid <STRING> - The UID of a player as returned by getPlayerUID
 * 1: unit <OBJECT> - The unit to return history to
 *
 * Return Value:
 * <EVENT> - erp_db_uidHistory(unit: object, history: hashmap)
 *
 * Public: No
 */

TRACE_1(QGVAR(buildHistory),_this);

params [
  ["_uid", "", [""]],
  ["_unit", objNull, [objNull]]
];

private _history = [_uid] call FUNC(uidHistory);

TRACE_3(QUOTE(GVAR(buildHistory) - BUILT),_unit,_uid,_history);
//--- By using the UID + JIP it should overwrite if this function gets called again
[QGVAR(uidHistory), [_unit, _history], _uid] call CBA_fnc_globalEventJIP;
