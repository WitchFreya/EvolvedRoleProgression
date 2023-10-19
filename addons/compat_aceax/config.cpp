#include "script_component.hpp"

#include "RscAttributes.inc"
#include "CfgEventHandlers.inc"

class CfgPatches
{
    class ADDON
    {
        name = QUOTE(COMPONENT);
        units[] = { };
        weapons[] = { };
        magazines[] = { };
        ammo[] = { };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "erp_main", "erp_arsenal", "aceax_main" };
        skipWhenMissingDependencies = 1;
        author = QUOTE(AUTHOR);
        VERSION_CONFIG;
    };
};
