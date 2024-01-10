#include "script_component.hpp"

/*
 * Author: Maid
 * Handle unit respawning
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit respawning
 * 1: corpse <OBJECT|objNull> - The unit's previous body.
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
