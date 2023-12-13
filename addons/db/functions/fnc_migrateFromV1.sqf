#include "script_component.hpp"

/*
 * Author: Maid
 * Migrate the database from V1.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * True on success, false on failure.
 *
 * Public: No
 */

private _rpDb = ["roleProgression"] call FUNC(getDb);
private _coreDb = call FUNC(getCoreDb);

private _playerIds = [_rpDb] call FUNC(read);

private _fnc_migratePlayerId = {
    params ["_rpDb", "_coreDb", "_uid"];
    private _roles = [_rpDb, _uid] call FUNC(read) select { _x != "name"; };
    private _myDb = [_uid] call FUNC(getUnitDb);
    private _myName = [_rpDb, _uid, "name"] call FUNC(read);
    [_myDb, "$metadata", "playerName", _myName] call FUNC(write);

    private _fnc_migrateRole = {
        params ["_rpDb", "_myDb", "_uid", "_role"];
        private _count = [_rpDb, _uid, _role] call FUNC(read);
        ASSERT_TRUE(IS_NUMBER(_count),"Invalid value for role");
        [_myDb, _role, "legacy_opCount", _count] call FUNC(write);
        [_myDb, _role, "rank", "Certified"] call FUNC(write);
    };

    { [_rpDb, _myDb, _uid, _x] spawn _fnc_migrateRole; } forEach _roles;
    [_coreDb, _uid, "name", _myName] call FUNC(write);
};

{ [_rpDb, _coreDb, _x] spawn _fnc_migratePlayerId } forEach _playerIds;
