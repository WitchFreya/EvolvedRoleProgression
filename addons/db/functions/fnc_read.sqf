#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve from the inidbi instance.
 *
 * See https://github.com/code34/inidbi2/blob/master/%40inidbi2/DOCUMENTATION.txt.
 *
 * Arguments:
 * 0: INIDBI2 instance <CODE>
 * 1: DB Section <STRING> - If provided, it will scope to the section. If nil, it will return all sections.
 * 2: Key <STRING> - If provided, it will return the value at the section>key. If nil, it will return all keys.
 * 3: Default <ANY> - If provided, return this value if the DB value is nil.
 *
 * Return Value:
 * Either a list of sections, a list of keys, the data at a section.key, or nil if something went wrong.
 *
 * Public: No
 */

params [
  ["_db", FUNCMAIN(noop), [{}]]
  , ["_section", nil, [nil, ""]]
  , ["_key", nil, [nil, ""]]
  , "_defaultValue"
];

private _args = switch true do {
  case (isNil {_section}): {"getSections"};
  case (isNil {_key}): {["getKeys", _section]};
  default {["read", [_section, _key, _defaultValue]]};
};

_args call FUNC(sterilize) call _db call FUNC(desterilize);
