#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the history data for a unit.
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit to collate the operational history for.
 *
 * Return Value:
 * Role history map <HASHMAP>
 *
 * Public: No
 */

params [
  ["_unit", objNull, [objNull]]
];

private _history = _unit getVariable QGVARMAIN(history);

if isNil {_history} exitWith {
  ERROR_2("Invalid history",_unit,player);
  throw "No history available for unit";
};

_history;
