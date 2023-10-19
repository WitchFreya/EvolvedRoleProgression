#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve role history from inidbi2
 *
 * Arguments:
 * None
 *
 * Return Value:
 * inidb2 <INIDBI2>
 *
 * Public: No
 */

private _db = call FUNC(getDb);

if (isNil "_db") exitWith {
    0;
};

private _users = "getSections" call _db apply {
    TRACE_1("Section",_x);
    private _section = _x;
    private _keyValues = ["getKeys", _section] call _db apply {
        private _value = ["read", [_section, _x]] call _db;
        [_x, _value];
    };

    [_section, createHashMapFromArray _keyValues];
};

createHashMapFromArray _users;
