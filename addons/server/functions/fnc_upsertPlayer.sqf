#include "script_component.hpp"

/*
 * Author: Maid
 * Find an existing player in the database by UID and update the name or create it if it doesn't exist.
 *
 * Arguments:
 * 0: Player UID <STRING>
 * 1: Player in-game profile name <STRING>
 *
 * Return Value:
 * true if is write was successful, false if not
 *
 * Public: No
 */

params ["_uid", "_name"];

private _history = missionNamespace getVariable QGVARMAIN(history);

if (isNil "_history") exitWith {
    ERROR_1("Unavailable history cache",_history);
};

private _maybeUserDetails = _history get _uid;

if (isNil "_maybeUserDetails") then {
    _history set [_uid, createHashMapFromArray [["name", _name]]];
};

private _maybeStoredName = _history get _uid get "name";

if (isNil "_maybeStoredName" || { _maybeStoredName != _name }) then {
    private _
};


["write", [_uid, "name", _name]] call FUNC(getDb);
