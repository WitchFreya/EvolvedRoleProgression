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
private _coreDb = [QGVARMAIN(core)] call FUNC(getDb);

private _playerIds = [_rpDb] call FUNC(read);

private _fnc_migratePlayerId = {
    private _uid = _x;
    private _roles = [_rpDb, _uid] call FUNC(read) select { _x != "name"; };
    private _myDbName = format ["%1_%2", QGVARMAIN(data), _uid];
    TRACE_1("DB Name",_myDbName);
    private _myDb = [_myDbName] call FUNC(getDb);
    private _fnc_write = { ([_myDb] + _this) call FUNC(write) };
    private _myName = [_rpDb, _uid, "name"] call FUNC(read);
    [_myDb, "$metadata", "playerName", _myName] call FUNC(write);

    private _fnc_migrateRole = {
        private _role = _x;
        private _count = [_rpDb, _uid, _role] call FUNC(read);
        ASSERT_TRUE(IS_NUMBER(_count),"Invalid value for role");
        [_myDb, _role, "legacy_opCount", _count] call FUNC(write);
        [_myDb, _role, "certificationType", "Certified"] call FUNC(write);
    };

    _fnc_migrateRole forEach _roles;
    [_coreDb, _uid, "name", _myName] call FUNC(write);
};

_fnc_migratePlayerId forEach _playerIds;
