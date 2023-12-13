#include "script_component.hpp"

/*
 * Author: Maid
 * Build role history for a single unit by UID.
 *
 * Arguments:
 * 0: uid <STRING> - The UID of a player as returned by getPlayerUID
 *
 * Return Value:
 * <HASHMAP> { [roleName: string]: { ops: Date[]; opCount: number; rank: string };
 *
 * Public: No
 */

#define READ_PROP(varProp,varDefault) [_db, _roleName, varProp, varDefault] call EFUNC(db,readOrDefault)

params ["_uid"];

private _db = [_uid] call EFUNC(db,getUnitDb);

private _cb_toRoleMap = {
  private _roleName = _x;
  private _legacyOpCount = READ_PROP("legacy_OpCount",0);
  private _ops = READ_PROP("ops",[]);
  private _rank = READ_PROP("rank","Untrained");

  private _opCount = _legacyOpCount + count _ops;
  [_roleName, createHashMapFromArray [
    ["ops", _ops],
    ["opCount", _opCount],
    ["rank", _rank]
  ]];
};

private _rolesCache = uiNamespace getVariable QEGVAR(roles,cache);
private _history = createHashMapFromArray (_rolesCache apply _cb_toRoleMap);

#undef READ_PROP

TRACE_1("History built",_history);
_history;
