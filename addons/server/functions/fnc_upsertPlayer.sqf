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
 * true if is write was successfull, false if not
 *
 * Public: No
 */

params ["_uid", "_name"];

["write", [_uid, "name", _name]] call FUNC(getDb);
