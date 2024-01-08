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
    requiredAddons[] = { "erp_main", "erp_roles", "ace_arsenal" };
    author = QUOTE(AUTHOR);
    VERSION_CONFIG;
  };
};


