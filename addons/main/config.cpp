#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = { "cba_main", "ace_main" };
    author = QUOTE(AUTHOR);
    VERSION_CONFIG;
  };
};

class CfgMods {
  class PREFIX {
    #include "../../mod.cpp"
  };
};

VERSIONING
