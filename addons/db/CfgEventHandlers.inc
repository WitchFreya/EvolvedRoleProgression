class Extended_PreStart_EventHandlers
{
  class ADDON
  {
    serverInit = QUOTE(call COMPILE_SCRIPT(XEH_preStartServer));
  };
};
class Extended_PreInit_EventHandlers
{
  class ADDON
  {
    serverInit = QUOTE(call COMPILE_SCRIPT(XEH_preInitServer));
  };
};
class Extended_PostInit_EventHandlers
{
  class ADDON
  {
    serverInit = QUOTE(call COMPILE_SCRIPT(XEH_postInitServer));
  };
};
