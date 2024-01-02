class RscText;
class RscButton;
class RscShortcutButton;
class RscPicture;
class RscListBox;
class RscListNBox;
class RscActivePicture;
class RscButtonMenu;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscFrame;
class RscStructuredText;

class ERP_Role_Menu
{
  idd = IDD_RolesMenu;
  movingEnable = 1;
  enableSimulation = 1;
  onLoad = QUOTE(_this call FUNC(onMenuOpen));
  onUnload = QUOTE(_this call FUNC(onMenuClose));

  class ControlsBackground
  {
    class Title : RscText
    {
      idc = IDC_Title;
      text = CSTRING(RoleMenu);
      x = QUOTE(POS_X(1));
      y = QUOTE(POS_Y(0));
      w = QUOTE(POS_W(38));
      h = QUOTE(POS_H(1));
      colorBackground[] = GUI_BCG_COLOR;
      moving = 1;
    };
    class Left : RscText
    {
      idc = -1;
      x = QUOTE(POS_X(1));
      y = QUOTE(POS_Y(1.5));
      w = QUOTE(POS_W(12));
      h = QUOTE(POS_H(22));
      colorBackground[] = {0,0,0,0.7};
    };
    class Middle : Left
    {
      x = QUOTE(POS_X(14));
      h = QUOTE(POS_H(19.5));
    };
    class Right : Left
    {
      x = QUOTE(POS_X(27));
    };
  };

  class Controls
  {
    class ExitButton : RscActivePicture
    {
      idc = IDC_CANCEL;
      text = "DBUG\pictures\x.paa";
      tooltip = "Close";
      x = QUOTE(POS_X(38));
      y = QUOTE(0);
      w = QUOTE(POS_W(1));
      h = QUOTE(POS_H(1));
      size = QUOTE(POS_H(0.5));
      color[] = {1,1,1,1};
      colorActive[] = {1,1,1,0.8};
      colorDisabled[] = {1,1,1,0.25};
    };

    class EditButton : ExitButton
    {
      idc = IDC_Edit;
      onButtonClick = QUOTE(call FUNC(toggleEdit));
      text = "a3\3den\data\displays\display3den\panelright\customcomposition_edit_ca.paa";
      tooltip = "Edit";
      x = QUOTE(POS_X(37));
      size = QUOTE(POS_H(0.4));
    };

    class PlayAsRoleButton : RscButton
    {
      idc = IDC_PlayButton;
      text = CSTRING(UseRole);
      x = QUOTE(POS_X(14));
      y = QUOTE(POS_Y(21.5));
      w = QUOTE(POS_W(12));
      h = QUOTE(POS_H(2));
      size = QUOTE(POS_H(0.9));
      colorBackground[] = {0.51,0.64,0.8,1};
      colorFocused[] = {0.51,0.64,0.8,1};
      colorText[] = IGUI_TEXT_COLOR;
      colorBackgroundActive[] = {0.95,0.45,0,1};
      colorDisabled[] = {0.86,0.89,0.93,1};
    };

    class RolesList : RscListBox
    {
      idc = IDC_RolesList;
      x = QUOTE(POS_X(1.5));
      y = QUOTE(POS_Y(2));
      w = QUOTE(POS_W(11));
      h = QUOTE(POS_H(21));
      onLBSelChanged = QUOTE(_this call FUNC(onLBSelChanged));
    };

    class RoleName : RscText
    {
      idc = IDC_RoleName;
      text = "Role Details";
      x = QUOTE(POS_X(14.5));
      y = QUOTE(POS_Y(2));
      w = QUOTE(POS_W(11));
      h = QUOTE(POS_H(1));
    };

    class RoleDetails : RscControlsGroup
    {
      idc = IDC_RoleDetails;
      x = QUOTE(POS_X(14));
      y = QUOTE(POS_Y(3));
      w = QUOTE(POS_W(12));
      h = QUOTE(POS_H(18));

      class Controls
      {
        class Description
        {
          idc = IDC_RoleDescription;
          type = CT_STRUCTURED_TEXT;
          style = ST_LEFT;
          text = "";
          x = QUOTE(GUI_GRID_WAbs * 0.02);
          y = QUOTE(GUI_GRID_HAbs * 0.02);
          w = QUOTE(11 * GUI_GRID_W);
          h = QUOTE(17.5 * GUI_GRID_H);
          size = 0.04;
        };
      };
    };

    class UnitRolesList : RscListNBox
    {
      idc = IDC_UnitRolesList;
      x = QUOTE(POS_X(27.5));
      y = QUOTE(POS_Y(2));
      w = QUOTE(POS_W(11));
      h = QUOTE(POS_H(21));
      columns[] = {0, 0.1, 0.85};
      drawSideArrows = 0;
      disableOverflow = 1;
    };
  };
};
