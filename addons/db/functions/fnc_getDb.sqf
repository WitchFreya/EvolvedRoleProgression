#include "script_component.hpp"

/*
 * Author: Maid
 * Get a DB instance for an ini file.
 *
 * See https://github.com/code34/inidbi2/blob/master/%40inidbi2/DOCUMENTATION.txt.
 *
 * Arguments:
 * 0: DB Name <STRING> - The name of the db.
 *
 * Return Value:
 * DB Instance <INIDBI2>
 *
 * Public: No
 */

params [
    ["_dbName", nil, [nil, ""]]
];

ASSERT_FALSE(isNil {_dbName},"Database name cannot be empty");

private _db = ["new", _dbName] call OO_INIDBI;

ASSERT_FALSE(isNil {_db},"Db could not be created");

_db;
