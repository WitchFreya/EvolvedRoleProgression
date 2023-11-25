#include "script_component.hpp"

#include "CfgEventHandlers.inc"
#include "ERP_Role_Menu.inc"

class CfgPatches
{
    class ADDON
    {
        name = QUOTE(COMPONENT);
        units[] = { };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "erp_arsenal", "erp_roles", "cba_keybinding" };
        author = QUOTE(AUTHOR);
        VERSION_CONFIG;
    };
};
