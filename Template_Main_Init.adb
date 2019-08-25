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
-- Version 1.00 dd. 17-08-2019 created by L. Dries                          --
------------------------------------------------------------------------------
-- Created from Template V1.00 by L. Dries on 01-06-2019                   --
------------------------------------------------------------------------------

pragma License(Unrestricted);
with Gdk.Types; use Gdk.Types;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Enums; use Gtk.Enums;
with Gtk.Handlers; use Gtk.Handlers;
With Gtk.Marshallers; use Gtk.Marshallers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- With statements for Dialogs
with Template_Dialog_Init;
with Template_FC_Init; use Template_FC_Init;
with Template_Main_CB; use Template_Main_CB;
with Template_General; use Template_General;
with Template_FC_Init; use Template_FC_Init;
with Template_Languages; use Template_Languages;
with Template_Languages_Dialog_Init; use Template_Languages_Dialog_Init;

package body Template_Main_Init is

   package Windows_CBR is new
     Gtk.Handlers.Return_Callback (GTk_Window_Record, Boolean);

   procedure Gtk_New(MainWindow : out Main_Window_Access) is
   begin
      MainWindow := new Main_Window_Record;
      Template_Main_Init.Init (MainWindow);
   end Gtk_New;

   procedure Init(MainWindow : access Main_Window_Record'Class) is
      pragma Suppress (All_Checks);
      Pixmaps_Dir : constant String := "pixmaps/";
   begin
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
      -- Build the Menu bar
      Gtk_New (MainWindow.Main_Bar);
      -- Place the File Menu
      Gtk_New_With_Mnemonic (MainWindow.File, To_String(Lan_File(Lan)));
      Gtk_New (MainWindow.File_Menu);
      Gtk_New (MainWindow.New_Project, To_String(Lan_New(Lan)));
      Append (MainWindow.File_Menu, MainWindow.New_Project);
      Gtk_New (MainWindow.Open, To_String(Lan_Open(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Open);
      Gtk_New (MainWindow.Save, To_String(Lan_Save(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Save);
      Gtk_New (MainWindow.Save_As, To_String(Lan_Save_As(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Save_As);
      Gtk_New (MainWindow.Separator1);
      Append (MainWindow.File_Menu, MainWindow.Separator1);
      Gtk_New (MainWindow.Print, To_String(Lan_Print(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Print);
      Gtk_New_With_Mnemonic (MainWindow.Print_Options, To_String(Lan_Print_Option(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Print_Options);
      Gtk_New (MainWindow.Separator2);
      Append (MainWindow.File_Menu, MainWindow.Separator2);
      Gtk_New (MainWindow.Properties, To_String(Lan_Properties(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Properties);
      Gtk_New (MainWindow.Languages, To_String(Lan_Language(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Languages);
      Gtk_New (MainWindow.Separator1);
      Append (MainWindow.File_Menu, MainWindow.Separator1);
      Gtk_New (MainWindow.Quit, To_String(Lan_Quit(Lan)));
      Append (MainWindow.File_Menu, MainWindow.Quit);
      Set_Submenu (MainWindow.File, MainWindow.File_Menu);
      Append (MainWindow.Main_Bar, MainWindow.File);
      -- Place the Edit Menu
      Gtk_New_With_Mnemonic (MainWindow.Edit, To_String(Lan_Edit(Lan)));
      Gtk_New (MainWindow.Edit_Menu);
      Gtk_New (MainWindow.Cut, To_String(Lan_Cut(Lan)));
      Append (MainWindow.Edit_Menu, MainWindow.Cut);
      Gtk_New (MainWindow.Copy, To_String(Lan_Copy(Lan)));
      Append (MainWindow.Edit_Menu, MainWindow.Copy);
      Gtk_New (MainWindow.Paste, To_String(Lan_Paste(Lan)));
      Append (MainWindow.Edit_Menu, MainWindow.Paste);
      Gtk_New (MainWindow.Delete, To_String(Lan_Delete(Lan)));
      Append (MainWindow.Edit_Menu, MainWindow.Delete);
      Set_Submenu (MainWindow.Edit, MainWindow.Edit_Menu);
      Append (MainWindow.Main_Bar, MainWindow.Edit);
      --------------------------------------------------------------------------
      -- This menu item should be completly changes because program specific  --
      -- items will be directed from here. This means that more or less       --
      -- main menitems ans sub menu items are possible                        --
      --------------------------------------------------------------------------
      -- Place the Test_Dialog Menu
      Gtk_New_With_Mnemonic (MainWindow.Template, "_Template");
      Gtk_New (MainWindow.Template_Menu);
      Gtk_New (MainWindow.Test, "Test");
      Append (MainWindow.Template_Menu, MainWindow.Test);
      Set_Submenu (MainWindow.Template, MainWindow.Template_Menu);
      Append (MainWindow.Main_Bar, MainWindow.Template);
      -- Place the View Menu
      Gtk_New_With_Mnemonic (MainWindow.View, To_String(Lan_View(Lan)));
      Append (MainWindow.Main_Bar, MainWindow.View);
      -- Place the Help Menu
      Gtk_New_With_Mnemonic (MainWindow.Help, To_String(Lan_Help(Lan)));
      Gtk_New (MainWindow.Help_Menu);
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
      Gtk_New (MainWindow.Scrolledwindow);
      Set_Policy (MainWindow.Scrolledwindow, Policy_Always, Policy_Always);
      Set_Shadow_Type (MainWindow.Scrolledwindow, Shadow_None);
      Set_Placement (MainWindow.Scrolledwindow, Corner_Top_Left);
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
         Get_Iter_At_Line (Get_Buffer (MainWindow.Textview), Iter, 0);
         Insert (Get_Buffer (MainWindow.Textview), Iter, "");
      end;
      Add (MainWindow.Scrolledwindow, MainWindow.Textview);
      Pack_Start
        (MainWindow.Main_Box1,
         MainWindow.Scrolledwindow,
         Expand  => True,
         Fill    => True,
         Padding => 0);
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
      --  Connect signals
      Windows_CBR.Connect
        (MainWindow, "delete_event",
         Windows_CBR.To_Marshaller(On_Window_Delete_Event'Access));
      On_Activate(MainWindow.New_Project, On_New'Access);
      Activate(MainWindow.Open);
      On_Activate(MainWindow.Open, On_Open'Access);
      Activate(MainWindow.Save);
      On_Activate(MainWindow.Save, On_Save'Access);
      Activate(MainWindow.Save_As);
      On_Activate(MainWindow.Save_As, On_Save_As'Access);
      Activate(MainWindow.Print);
      On_Activate(MainWindow.Print, On_Print'Access);
      Activate(MainWindow.Print_Options);
      On_Activate(MainWindow.Print_Options, On_Print_Options'Access);
      Activate(MainWindow.Properties);
      On_Activate(MainWindow.Properties, On_Properties'Access);
      Activate(MainWindow.Languages);
      On_Activate(MainWindow.Languages, On_Languages'Access);
      Activate(MainWindow.Quit);
      On_Activate(MainWindow.Quit, On_Window_Destroy'Access);
      Activate(MainWindow.Cut);
      On_Activate(MainWindow.Cut, On_Cut'Access);
      Activate(MainWindow.Copy);
      On_Activate(MainWindow.Copy, On_Copy'Access);
      Activate(MainWindow.Paste);
      On_Activate(MainWindow.Paste, On_Paste'Access);
      Activate(MainWindow.Delete);
      On_Activate(MainWindow.Delete, On_Delete'Access);
      -- Activate user program menuitems
      Activate(MainWindow.Test);
      On_Activate(MainWindow.Test, On_Test'Access);
      -- End Activate user program menuitems
      Activate(MainWindow.About);
      On_Activate(MainWindow.About, On_About'Access);
      -- Initiation of Dialogs
      --------------------------------------------------------------------------
      -- Change "Template_Dialog" in the name of the dialog                   --
      -- If necesary enter more dialogs or remove this statement              --
      --------------------------------------------------------------------------
      Gtk_New (Template_Dialog_Init.Main_Dialog);
      Init_Open;
      Init_Save;
      Init_Select_Folder;
      Gtk_New (Template_Languages_Dialog_Init.Lan_Dialog);
      --------------------------------------------------------------------------
      -- Other initiation staments
      --------------------------------------------------------------------------
      File_Name := To_Unbounded_String(Default_Name);
   end Init;

end Template_Main_Init;
