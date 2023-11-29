#include "script_component.hpp"

/*
 * Author: Maid
 * Return true if a db, section, or key already exists, false otherwise.
 *
 * See https://github.com/code34/inidbi2/blob/master/%40inidbi2/DOCUMENTATION.txt.
 *
 * Arguments:
 * 0: DB <INIDBI2> - The name of the db.
 * 1: Section <STRING>
 * 2: Key <STRING>
 *
 * Return Value:
 * True if it existed, false otherwise.
 *
 * Public: No
 */

params [
    ["_db", FUNCMAIN(noop), [{}]]
    , ["_section", nil, [nil, ""]]
    , ["_key", nil, [nil, ""]]
];

if (isNil {"getVersion" call _db;}) exitWith {false};
if (!("exists" call _db)) exitWith {false};
if (isNil {_section}) exitWith {true};
private _sections = [_db] call FUNC(read);
if (!IS_ARRAY(_sections) || { count _sections == 0 } || {!(_section in _sections)}) exitWith {false};
if (isNil {_key}) exitWith {true};
private _keys = [_db, _section] call FUNC(read);
if (!(_key in _keys)) exitWith {false};
true;
