#define A3_RANKS \A3\Ui_f\data\GUI\Cfg\Ranks
class CfgRoles
{
    class Default
    {
        ITEM_META(1);
        icon = QUOTE(A3_RANKS\sergeant_gs);
    };

    class Rifleman : Default
    {
        SCOPE(2);
        displayName = "Rifleman";
    };

    class CombatLifeSaver : Default {
        SCOPE(2);
        displayName = "Combat Life Saver";
    };

    class Medic : Default
    {
        SCOPE(2);
        displayName = "Medic";
    };
    class MachineGunner : Default
    {
        SCOPE(2);
        displayName = "Machine Gunner";
    };
    class Marksman : Default
    {
        SCOPE(2);
        displayName = "Marksman";
    };
    class Sniper : Default
    {
        SCOPE(2);
        displayName = "Sniper";
    };
    class Grenadier : Default
    {
        SCOPE(2);
        displayName = "Grenadier";
    };
    class Engineer : Default
    {
        SCOPE(2);
        displayName = "Engineer";
    };
    class DroneOperator : Default
    {
        SCOPE(2);
        displayName = "Drone Operator";
    };

    class AntiarmorSpecialist : Default
    {
        SCOPE(2);
        displayName = "Antiarmor Specialist";
    };

    class TeamLead : Default
    {
        SCOPE(2);
        displayName = "Team Lead";
    };

    class PlatoonLead : Default
    {
        SCOPE(2);
        displayName = "Platoon Lead";
    };

    class ArmorCrew : Default
    {
        SCOPE(2);
        displayName = "Armor Crew";
    };

    class Pilot : Default
    {
        SCOPE(2);
        displayName = "Pilot";
    };

    class Copilot : Default
    {
        SCOPE(2);
        displayName = "Copilot";
    };

    class Architect : Default
    {
        SCOPE(2);
        displayName = "Architect";
    };
};
#undef A3_RANKS
