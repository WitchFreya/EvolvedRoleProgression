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

private _defaultRoleTraits = compileFinal createHashMapFromArray [
    ["Engineer", false]
    , ["ExplosiveSpecialist", false]
    , ["Medic", false]
    , ["UAVHacker", false]
    , ["AudibleCoef", 1]
    , ["CamouflageCoef", 1]
    , ["LoadCoef", 1]
];

private _unitTraits = [
    "Engineer"
    , "ExplosiveSpecialist"
    , "Medic"
    , "UAVHacker"
    , "AudibleCoef"
    , "CamouflageCoef"
    , "LoadCoef"
];

// TODO: Move these into settings or configs or something.
private _customTraitsRoles = createHashMapFromArray [
    ["Rifleman", [
        ["LoadCoef", 0.9]]]
    , ["CombatLifeSaver", [
        ["Medic", true]
        , ["CamouflageCoef", 0.9]]]
    , ["Medic", [
        ["Medic", true]
        , ["CamouflageCoef", 0.9]]]
    , ["Sniper", [
        ["CamouflageCoef", 0.8]]]
    , ["Engineer", [
        ["Engineer", true]
        , ["ExplosiveSpecialist", true]
        , ["UAVHacker", true]
        , ["LoadCoef", 0.9]]]
    , ["DroneOperator", [
        ["UAVHacker", true]
        , ["CamouflageCoef", 0.8]]]
    , ["AntiarmorSpecialist",
        [["LoadCoef", 0.9]]]
    , ["ArmorCrew", [
        ["Engineer", true]]]
    , ["Pilot", [
        ["Engineer", true]]]
    , ["Copilot", [
        ["Medic", true]]]
];

private _roleTraitMap = _rolesCache apply {
    private _name = _x;
    private _customTraitsRole = createHashMapFromArray (_customTraitsRoles getOrDefault [_name, []]);
    private _traits = createHashMapFromArray (_unitTraits apply {
        private _trait = _x;
        private _traitValue = _customTraitsRole getOrDefault [_trait, _defaultRoleTraits get _trait];
        [_trait, _traitValue];
    });
    [_name, _traits];
};

createHashMapFromArray _roleTraitMap;
