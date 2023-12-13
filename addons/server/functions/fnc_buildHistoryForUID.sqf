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


params ["_uid"];

private _db = [_uid] call EFUNC(db,getUnitDb);

private _cb_toRoleMap = {
  private _role = _x;
  #define READ_PROP(varProp,varDefault) [_db, _role, varProp, varDefault] call EFUNC(db,readOrDefault)
  private _legacyOpCount = READ_PROP("legacy_OpCount",0);
  private _ops = READ_PROP("ops",[]);
  private _rank = READ_PROP("rank","Untrained");
  #undef READ_PROP

  private _opCount = _legacyOpCount + count _ops;
  [_role, createHashMapFromArray [
    ["ops", _ops],
    ["opCount", _opCount],
    ["rank", _rank]
  ]];
};

private _roles = call EFUNC(roles,classNames);
private _history = createHashMapFromArray (_roles apply _cb_toRoleMap);


TRACE_1("History built",_history);
_history;
