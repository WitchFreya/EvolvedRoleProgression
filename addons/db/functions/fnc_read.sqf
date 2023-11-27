#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve from the inidbi instance and cache if it's already been queried.
 *
 * See https://github.com/code34/inidbi2/blob/master/%40inidbi2/DOCUMENTATION.txt.
 *
 * Arguments:
 * 0: INIDBI2 instance <CODE>
 * 1: DB Section <STRING> - If provided, it will scope to the section. If nil, it will return all sections.
 * 2: Key <STRING> - If provided, it will return the value at the section>key. If nil, it will return all keys.
 *
 * Return Value:
 * Either a list of sections, a list of keys, or the data at a section.key.
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
