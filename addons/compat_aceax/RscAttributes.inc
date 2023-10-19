#include "defines.hpp"

class RscListBox;

class ace_arsenal_display
{
    class controls
    {
        class leftTabContent : RscListBox
        {
            onLBSelChanged = QUOTE(_this call FUNC(onLBSelChanged));
        };
    };
};
