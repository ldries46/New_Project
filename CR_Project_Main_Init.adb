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
with Gdk.Types;                        use Gdk.Types;
with Gtk.Widget;                       use Gtk.Widget;
with Gtk.Enums;                        use Gtk.Enums;
with Gtk.Handlers;                     use Gtk.Handlers;
With Gtk.Marshallers;                  use Gtk.Marshallers;

-- With statements for Dialogs
--------------------------------------------------------------------------------
-- Change "CR_Project_Dialoginit" in the name of the dialog                    --
-- If necesary enter more dialogs or remove this statement                    --
--------------------------------------------------------------------------------
with CR_Project_Names_Init;
with CR_Project_DNames_Init;
with CR_Project_FC_Init;               use CR_Project_FC_Init;
--------------------------------------------------------------------------------
-- Change "CR_Project_General" in the name of the general package               --
--------------------------------------------------------------------------------
with CR_Project_Main_CB;               use CR_Project_Main_CB;
with CR_Project_General;               use CR_Project_General;
with CR_Project_FC_Init;               use CR_Project_FC_Init;
with CR_Project_Languages;             use CR_Project_Languages;
with CR_Project_Languages_Dialog_Init; use CR_Project_Languages_Dialog_Init;

package body CR_Project_Main_Init is

   package Windows_CBR is new
     Gtk.Handlers.Return_Callback (GTk_Window_Record, Boolean);

   procedure Gtk_New(MainWindow : out Main_Window_Access) is
   begin
      MainWindow := new Main_Window_Record;
      CR_Project_Main_Init.Init (MainWindow);
   end Gtk_New;

   procedure Init(MainWindow : access Main_Window_Record'Class) is
      pragma Suppress (All_Checks);
      Pixmaps_Dir : constant String := "pixmaps/";
   begin
      --------------------------------------------------------------------------
      --Toplevel Window Creation                                              --
      --------------------------------------------------------------------------
      Gtk.Window.Initialize (MainWindow, Window_Toplevel);
      MainWindow.Set_Title (To_String(Lan_Window_Title(Lan)));
      Set_Position (MainWindow, Win_Pos_Center);
      Set_Modal (MainWindow, False);
      Set_Resizable (MainWindow, True);
      Set_Default_Size (MainWindow, Mainsize_H, Mainsize_V);
      if Set_Icon_From_File(MainWindow, Icon_Name) then
         On_Window_Destroy(null);
      end if;
      Gtk_New (MainWindow.Main_Box1, Orientation_Vertical, 0);
      --------------------------------------------------------------------------
      -- Menu Creation
      --------------------------------------------------------------------------
      Gtk_New (MainWindow.Main_Bar);
      Gtk_New_With_Mnemonic (MainWindow.File, To_String(Lan_File(Lan)));
      Gtk_New (MainWindow.File_Menu);
      -- New
      Gtk_New (MainWindow.New_Project, To_String(Lan_New(Lan)));
      Append (MainWindow.File_Menu, MainWindow.New_Project);
      -- Source Directory
      Gtk_New (MainWindow.Open, To_String(Lan_Open(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Open);
      -- New_Project
      Gtk_New (MainWindow.Save, To_String(Lan_Save(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Save);
      Gtk_New (MainWindow.Separator1);
      Append (MainWindow.File_Menu, MainWindow.Separator1);
      -- Language
      Gtk_New (MainWindow.Languages, To_String(Lan_Language(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Languages);
      Gtk_New (MainWindow.Separator2);
      Append (MainWindow.File_Menu, MainWindow.Separator2);
      -- Quit
      Gtk_New (MainWindow.Quit, To_String(Lan_Quit(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Quit);
      Set_Submenu (MainWindow.File, MainWindow.File_Menu);
      Append (MainWindow.Main_Bar, MainWindow.File);
       -- Create Creation
      Gtk_New_With_Mnemonic (MainWindow.CR_Project, To_String(Lan_Create(Lan)));
      Gtk_New (MainWindow.CR_Project_Menu);
      -- Full
      Gtk_New (MainWindow.Full, To_String(Lan_Total(Lan)));
      Append (MainWindow.CR_Project_Menu, MainWindow.Full);
      -- Dialog
      Gtk_New (MainWindow.Dial, To_String(Lan_Dial(Lan)));
      Append (MainWindow.CR_Project_Menu, MainWindow.Dial);
      Set_Submenu (MainWindow.CR_Project, MainWindow.CR_Project_Menu);
      Append (MainWindow.Main_Bar, MainWindow.CR_Project);
      -- Help Creation
      Gtk_New_With_Mnemonic (MainWindow.Help, To_String(Lan_Help(Lan)));
      Gtk_New (MainWindow.Help_Menu);
      -- About
      Gtk_New_With_Mnemonic (MainWindow.About, To_String(Lan_About(Lan)));
      Append (MainWindow.Help_Menu, MainWindow.About);
      Set_Submenu (MainWindow.Help, MainWindow.Help_Menu);
      Append (MainWindow.Main_Bar, MainWindow.Help);
      Pack_Start
        (MainWindow.Main_Box1,
         MainWindow.Main_Bar,
         Expand  => False,
         Fill    => False,
         Padding => 0);
      --------------------------------------------------------------------------
      -- Scrolled Window                                                      --
      --------------------------------------------------------------------------
      Gtk_New (MainWindow.Scrolledwindow);
      Set_Policy (MainWindow.Scrolledwindow, Policy_Always, Policy_Always);
      Set_Shadow_Type (MainWindow.Scrolledwindow, Shadow_None);
      Set_Placement (MainWindow.Scrolledwindow, Corner_Top_Left);
      --------------------------------------------------------------------------
      -- TextView                                                             --
      --------------------------------------------------------------------------
      Gtk_New (MainWindow.Textview);
      Set_Editable (MainWindow.Textview, True);
      Set_Justification (MainWindow.Textview, Justify_Left);
      Set_Wrap_Mode (MainWindow.Textview, Wrap_None);
      Set_Cursor_Visible (MainWindow.Textview, True);
      Set_Pixels_Above_Lines (MainWindow.Textview, 0);
      Set_Pixels_Below_Lines (MainWindow.Textview, 0);
      Set_Pixels_Inside_Wrap (MainWindow.Textview, 0);
      Set_Left_Margin (MainWindow.Textview, 0);
      Set_Right_Margin (MainWindow.Textview, 0);
      Set_Indent (MainWindow.Textview, 0);
      declare
         Iter : Gtk_Text_Iter;
      begin
         MainWindow.Buffer := Get_Buffer (MainWindow.Textview);
         Get_Iter_At_Line (MainWindow.Buffer, Iter, 0);
         Insert (MainWindow.Buffer, Iter, "");
      end;
      Add (MainWindow.Scrolledwindow, MainWindow.Textview);
      Pack_Start
        (MainWindow.Main_Box1,
         MainWindow.Scrolledwindow,
         Expand  => True,
         Fill    => True,
         Padding => 0);
      --------------------------------------------------------------------------
      -- Status Bar                                                           --
      --------------------------------------------------------------------------
      Gtk_New (MainWindow.Statusbar);
      Pack_Start
        (MainWindow.Main_Box1,
         MainWindow.Statusbar,
         Expand  => False,
         Fill    => False,
         Padding => 0);
      Add (MainWindow, MainWindow.Main_Box1);
      Set_Size_Request (MainWindow, Mainsize_H, Mainsize_V );
      Grab_Default (MainWindow);
      --------------------------------------------------------------------------
      --  Connect signals                                                     --
      --------------------------------------------------------------------------
      Windows_CBR.Connect
        (MainWindow, "delete_event",
         Windows_CBR.To_Marshaller(On_Window_Delete_Event'Access));
      On_Activate(MainWindow.New_Project, On_New'Access);
      Activate(MainWindow.Open);
      On_Activate(MainWindow.Open, On_Source_Dir'Access);
      Activate(MainWindow.Save);
      On_Activate(MainWindow.Save, On_New_Project'Access);
      Activate(MainWindow.Languages);
      On_Activate(MainWindow.Languages, On_Languages'Access);
      Activate(MainWindow.Quit);
      On_Activate(MainWindow.Quit, On_Window_Destroy'Access);
      -- Activate user program menuitems
      Activate(MainWindow.Full);
      On_Activate(MainWindow.Full, On_Full_Project'Access);
      Activate(MainWindow.Dial);
      On_Activate(MainWindow.Dial, On_Only_Dialog'Access);
      -- End Activate user program menuitems
      Activate(MainWindow.About);
      On_Activate(MainWindow.About, On_About'Access);
      -- Initiation of Dialogs
      --------------------------------------------------------------------------
      -- Change "CR_Project_Dialog" in the name of the dialog                   --
      -- If necesary enter more dialogs or remove this statement              --
      --------------------------------------------------------------------------
      CR_Project_Names_Init.Gtk_New (CR_Project_Names_Init.Main_Dialog);
      CR_Project_DNames_Init.Gtk_New (CR_Project_DNames_Init.Main_Dialog);
      Init_Open;
      Init_Save;
      -- Program Specific dialogs
      Init_Select_Folder;
      Gtk_New (CR_Project_Languages_Dialog_Init.Lan_Dialog);
      --------------------------------------------------------------------------
      -- Other initiation staments
      --------------------------------------------------------------------------
      File_Name := To_Unbounded_String(Default_Name);
   end Init;

end CR_Project_Main_Init;
