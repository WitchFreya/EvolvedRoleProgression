#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve an inidb2 instance to execute commands against.
 *
 * See https://github.com/code34/inidbi2/blob/master/%40inidbi2/DOCUMENTATION.txt.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * inidb2 <INIDBI2>
 *
 * Public: No
 */

params [
    ["_db", FUNCMAIN(noop), [{}]]
    , ["_section", nil, [nil, ""]]
    , ["_key", nil, [nil, ""]]
];

private _args = switch true do {
    case (isNil "_section"): {"getSections"};
    case (isNil "_key"): {["getKeys", _section]};
    default {["read", [_section, _key]]};
};

private _cacheKey = _args;

GVAR(cache) getOrDefault [_args, _args call _db, true];
