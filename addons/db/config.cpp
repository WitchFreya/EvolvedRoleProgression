#include "script_component.hpp"

#include "CfgEventHandlers.inc"

class CfgPatches
{
    class ADDON
    {
        name = QUOTE(COMPONENT);
        units[] = { };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "erp_main", "inidbi2" };
        skipWhenMissingDependencies = 1;
        author = QUOTE(AUTHOR);
        VERSION_CONFIG;
    };
};


