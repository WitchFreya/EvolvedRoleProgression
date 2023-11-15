#include "script_component.hpp"

/**
 * Author: Maid
 * Create the traits map for a role
 *
 * Arguments:
 * 0: Roles cache <HASHMAP> - The cache of roles from erp_roles.
 *
 * Return Value:
 * Trait Map <HASHMAP>
 *
 * Example:
 *  [] call createRoleTraitMap;
 *
 * Public: No
 */

params ["_rolesCache"];


private _fnc_mapFromConfig = {
    params ["_config"];
    private _properties = configProperties [_config];
    private _nameAndValues  = _properties apply {
        private _name = configName _x;
        private _value = _x call BIS_fnc_getCfgData;
        [_name, _value];
    };
    createHashMapFromArray _nameAndValues;
};

createHashMapFromArray (_rolesCache apply {
    private _name = _x;
    private _path = _y get "path";
    private _traits = [_path >> "UnitTraits"] call _fnc_mapFromConfig;
    private _variables = [_path >> "UnitVariables"] call _fnc_mapFromConfig;
    private _map = createHashMapFromArray [
        ["traits", _traits]
        , ["variables", _variables]
    ];
    [_name, _map];
});
