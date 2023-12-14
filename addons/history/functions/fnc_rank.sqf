#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the current rank a unit has in a role.
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit to collate the operational history for.
 * 1: role <STRING> - The role to examine rank.
 *
 * Return Value:
 * Their rank class name cross-referenced to CfgRanks in CfgRole or Uncertified.
 *
 * Public: No
 */


params [
  ["_unit", objNull, [objNull]],
  ["_role", "Rifleman", [""]]
];

private _history = [_unit, _role] call FUNC(forRole);
_history getOrDefault ["rank", "Uncertified"];
