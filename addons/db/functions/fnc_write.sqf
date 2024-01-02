#include "script_component.hpp"

/*
 * Author: Maid
 * Write to the database and blow up the cache.
 *
 * See https://github.com/code34/inidbi2/blob/master/%40inidbi2/DOCUMENTATION.txt.
 *
 * Arguments:
 * 0: INIDBI2 instance <CODE>
 * 1: DB Key.Value <[STRING,STRING]> - Where to write the data
 * 2: Value <STRING|SCALAR|BOOLEAN|ARRAY> - If provided, it will return the value at the section>key. If nil, it will return all keys.
 *
 * Return Value:
 * True if the write was a success, false otherwise
 *
 * Public: No
 */

params [
    ["_db", FUNCMAIN(noop), [{}]]
    , ["_section", nil, [nil, ""]]
    , ["_key", nil, [nil, ""]]
    , "_value"
];

ASSERT_FALSE(isNil {_section},"Section cannot be empty");
ASSERT_FALSE(isNil {_key},"Key cannot be empty");

// All writes wipe the cache—it's just more practical.
GVAR(cache) = createHashMap;

["write", [_section, _key, _value]] call _db;
