#include "script_component.hpp"

/*
 * Author: Maid
 * Handle the erp_roles_updateRank event.
 *
 * Arguments:
 * 0: unit <OBJECT> - Unit to change ranks for
 * 1: changes <[Role Class Name, Rank Class Name][]> - The ranks to set.
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [["Rifleman", "Probationary"]] call erp_db_fnc_onUpdateRank;
 *
 * Public: No
 */

params [
  ["_unit", objNull, [objNull]],
  ["_rankChanges", [], [[]]]
];

private _uid = getPlayerUID _unit;
private _db = [_uid] call FUNC(getUnitDb);

{
  _x params [
    ["_role", "", [""]],
    ["_rank", "", [""]]
  ];
  [_db, _role, _rank] call FUNC(writeRank);
} forEach _rankChanges;
