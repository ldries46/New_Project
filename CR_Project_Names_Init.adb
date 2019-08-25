------------------------------------------------------------------------------
--                                                                          --
--      Copyright (C) 2019 L. Dries                                         --
--                                                                          --
-- This program is free software;  you can redistribute it and/or modify it --
-- under terms of the  GNU General Public License  as published by the Free --
-- Software  Foundation;  either version 3,  or (at your  option) any later --
-- version. This library is distributed in the hope that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE.                            --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
------------------------------------------------------------------------------
-- Version 1.00 dd. 01-05-2019 created by L. Dries                          --
------------------------------------------------------------------------------
-- Created from Template V1.00 by L. Dries on 01-05-2019                    --
------------------------------------------------------------------------------

pragma License(Unrestricted);
with Gtk.Enums;              use Gtk.Enums;
with Gtk.Handlers;         use Gtk.Handlers;
with CR_Project_Names_CB;  use CR_Project_Names_CB;
with CR_Project_General;   use CR_Project_General;
with CR_Project_Main_Init; use CR_Project_Main_Init;
with CR_Project_Languages; use CR_Project_Languages;

package body CR_Project_Names_Init is

   package Dialog_CBR is new
     Gtk.Handlers.Return_Callback (Gtk_Dialog_Record, Boolean);
   package Button is new
     Gtk.Handlers.Callback (Gtk_Button_Record);

   procedure Gtk_New(MainDialog : out Names_Access) is
   begin
      MainDialog := new Names_Record;
      CR_Project_Names_Init.Init (MainDialog);
   end Gtk_New;

   procedure Init(MainDialog : access Names_Record'Class) is
      pragma Suppress (All_Checks);
      Pixmaps_Dir : constant String := "pixmaps/";
   begin
      -- Creation of the Dialog Window
      Gtk.Dialog.Initialize (MainDialog);
      MainDialog.Set_Title (To_String(Lan_Full_Title(Lan)));
      Set_Position (MainDialog, Win_Pos_Center);
      Set_Modal (MainDialog, true);
      Set_Resizable (MainDialog, false);
      Set_Default_Size (MainDialog, Dialogsize_H, Dialogsize_V);
      if Set_Icon_From_File(MainDialog, Icon_Name) then
         On_Names_End(null);
      end if;
      -- Creation of the Basic Box
      MainDialog.Dialog_Box := Get_Content_Area(MainDialog);
      Gtk_New (MainDialog.Input_Box, Orientation_Vertical, 0);
      -- Creation of the Box for the normal Input met Label
      Gtk_New (MainDialog.InputT_Entry, Orientation_Horizontal, 0);
      Gtk_New (MainDialog.InputD_Entry, Orientation_Horizontal, 0);
      -- Creation of the Template name  and Dialog
      Gtk_New_with_Mnemonic (MainDialog.LabelT_Entry, "Template --> ");
      Set_Justify(MainDialog.LabelT_Entry, Gtk.Enums.Justify_Right);
      Gtk_New_with_Mnemonic (MainDialog.LabelD_Entry, "Template_Dialog --> ");
      Set_Justify(MainDialog.LabelD_Entry, Gtk.Enums.Justify_Right);
      Pack_Start
        (MainDialog.InputT_Entry,
         MainDialog.LabelT_Entry,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      Pack_Start
        (MainDialog.InputD_Entry,
         MainDialog.LabelD_Entry,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      Gtk_New (MainDialog.Template_Entry);
      Gtk_New (MainDialog.Dialog_Entry);
      Pack_Start
        (MainDialog.InputT_Entry,
         MainDialog.Template_Entry,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      Pack_Start
        (MainDialog.InputD_Entry,
         MainDialog.Dialog_Entry,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      Pack_Start
        (MainDialog.Input_Box,
         MainDialog.InputT_Entry,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      Pack_Start
        (MainDialog.Input_Box,
         MainDialog.InputD_Entry,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      Pack_Start
        (MainDialog.Dialog_Box,
         MainDialog.Input_Box,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      -- Buttons                                         --
      Gtk_New (MainDialog.Button_Box, Orientation_Horizontal, 0);
      -- Cancel Button
      Gtk_New_with_Mnemonic (MainDialog.LabelB_But, "");
      Gtk_New (MainDialog.Cancel, To_String(Lan_Cancel(Lan)));
      Pack_Start
        (MainDialog.Button_Box,
         MainDialog.LabelB_But,
         Expand  => True,
         Fill    => True,
         Padding => 2);
     Pack_Start
        (MainDialog.Button_Box,
         MainDialog.Cancel,
         Expand  => True,
         Fill    => True,
         Padding => 2);
      -- OK Button
      Gtk_New (MainDialog.OK, To_String(Lan_OK(Lan)));
      Pack_Start
        (MainDialog.Button_Box,
         MainDialog.OK,
         Expand  => True,
         Fill    => True,
         Padding => 2);
      Pack_Start
        (MainDialog.Dialog_Box,
         MainDialog.Button_Box,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      -- Set a Size Request
      Set_Size_Request(MainDialog, Dialogsize_H, Dialogsize_V);
      -- Signal events
      Dialog_CBR.Connect(MainDialog, "delete_event",
                         Dialog_CBR.To_Marshaller(On_Names_Delete_Event'Access));
      Button.Connect(MainDialog.OK, "clicked",
                     Button.To_Marshaller(On_OK'Access));
      Button.Connect(MainDialog.Cancel, "clicked",
                     Button.To_Marshaller(On_Names_End'Access));
   end Init;

--------------------------------------------------------------------------------
-- Change "CR_Project_Dialog_Init" in the name of the package                        --
--------------------------------------------------------------------------------
end CR_Project_Names_Init;
