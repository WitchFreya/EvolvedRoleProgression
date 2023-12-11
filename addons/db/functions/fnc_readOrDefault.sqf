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
 * 3: Default <ANY> - Return this value if the DB value is nil.
 *
 * Return Value:
 * Either a list of sections, a list of keys, or the data at a section.key.
 *
 * Public: No
 *
 * Example:
 * [_db, "section", "key", 1] call erp_db_fnc_readOrDefault;
 */

params ["","","","_default"];

private _res = _this call FUNC(read);

if !(IS_NOTHING(_res)) exitWith {_res};
_default;
