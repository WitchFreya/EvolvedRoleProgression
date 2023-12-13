#include "script_component.hpp"

/*
 * Author: Maid
 * Scan CfgRoles to find relevant roles.
 *
 * Arguments:
 * 0: Config file to scan <CONFIG>
 *
 * Return Value:
 * 0: Roles cache <HASHMAP>
 * 1: Roles alphabetized <ARRAY>
 *
 * Public: No
 */

params ["_config"];
private _filter = toString {
    configName _x isKindOf [QUOTE(BASE_ROLE), _config >> "CfgRoles"] && {
        (getNumber (_x >> "scopeArsenal")) == 2;
    };
};

private _roles = _filter configClasses (_config >> "CfgRoles") apply {
	private _name = (_x >> "displayName") call BIS_fnc_getCfgData;
    private _description = (_x >> "description") call BIS_fnc_getCfgData;

	private _path = _x;
	private _icon = [_x, "icon", QPATHTOEF(common,data\sws_icon_howl_ca.paa)] call BIS_fnc_returnConfigEntry;
	private _key = configName _x;
	private _map = createHashMapFromArray [
		["name", _name]
		, ["path", _path]
		, ["icon", _icon]
        , ["description", _description]
	];
	[_key, _map];
};

private _ordered = [_roles, [], {
	_x params ["_key", "_value"];
	_value get "name";
}] call BIS_fnc_sortBy;
private _order = _ordered apply { _x select 0; };
private _roleMap = createHashMapFromArray _roles;

[_roleMap, _order];
