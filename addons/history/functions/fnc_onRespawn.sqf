#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the history data for a role.
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit to collate the operational history for.
 * 1: role <STRING> - Optional, the role to limit the check to.
 *
 * Return Value:
 * Role history object <HASHMAP> or an empty hashmap.
 *
 * Public: No
 */

params [
  "_unit"
];

if !(local _unit) exitWith {};
if !(isNil {_unit getVariable QGVAR(history)}) exitWith {
  TRACE_1("Unit history is intact, continuing",_unit);
};

[QEGVAR(db,buildHistory), [getPlayerUID player]] call CBA_fnc_serverEvent;
