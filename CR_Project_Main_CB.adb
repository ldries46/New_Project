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
with Glib;                            use Glib;
with Gtk.Main;
with Gtk.Tree_Model;
with Gtk.GEntry;                      use Gtk.GEntry;
with Gtk.Combo_Box_Text;              use Gtk.Combo_Box_Text;
with Ada.Strings.Unbounded;           use Ada.Strings.Unbounded;
-- If no Init Files are used then this call can be deleted
with Program_Init;                    use Program_Init;
-- With statements for Dialogs
--------------------------------------------------------------------------------
-- Change "CR_Project_Dialog" in the name of the dialog                       --
-- If necesary enter more dialogs or remove this statement                    --
--------------------------------------------------------------------------------
with CR_Project_Names_Init;
with CR_Project_DNames_Init;
with CR_Project_FC_Init;               use CR_Project_FC_Init;
with CR_Project_Languages;             use CR_Project_Languages;
with CR_Project_Languages_Dialog_Init; use CR_Project_Languages_Dialog_Init;

package body CR_Project_Main_CB is

   -----------------------------------------------------------------------------
   -- Internal procedure End_Program used in the Quit and Exit commands
   -----------------------------------------------------------------------------
   procedure End_Program is
   begin
      Close_Ini;
      Gtk.Main.Main_Quit;
   end End_Program;

   -----------------------------------------------------------------------------
   -- Internal procedure Stop file chooser Buttons
   -----------------------------------------------------------------------------
   procedure Stop_File_Chooser is
   begin
      Close_Ini;
      Gtk.Main.Main_Quit;
   end Stop_File_Chooser;

   -----------------------------------------------------------------------------
   -- Procedure On Window_Destroy used in the Destroy command
   -----------------------------------------------------------------------------
   procedure On_Window_Destroy (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      -- At this point the ini files must be closed. All ini files are updated
      -- and closed with one call to Close_IIni
      -- If no Init Files are used then this call can be deleted
      End_Program;
   end On_Window_Destroy;

   -----------------------------------------------------------------------------
   -- Procedure On Window_Delete_Event used in the Delete_Event
   -----------------------------------------------------------------------------
   function On_Window_Delete_Event (Object : access Gtk_Window_Record'Class;
                                    Event : Gdk.Event.Gdk_Event) return boolean is
      pragma Unreferenced (Object);
   begin
      End_Program;
      return true;
   end On_Window_Delete_Event;

   -----------------------------------------------------------------------------
   -- Procedure On_New used in the File New command
   -----------------------------------------------------------------------------
   procedure On_New (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      first_file := true;
      File_Name := To_Unbounded_String(Default_Name);
   end On_New;

   -----------------------------------------------------------------------------
   -- Procedure On_Source_Dir used in the File Source Dir command
   -----------------------------------------------------------------------------
   procedure On_Source_Dir (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
      b : boolean;
   begin
      File := Open;
      First_file := false;
      b := File_Dir_Dialog.Set_Current_Folder(To_String(Inp_Folder));
      File_Dir_Dialog.Show_All;
   end On_Source_Dir;

   -----------------------------------------------------------------------------
   -- Procedure On_Save used in the File Save As command
   -----------------------------------------------------------------------------
   procedure On_New_Project (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
      b : boolean;
   begin
      File := Save;
      b := File_Dir_Dialog.Set_Current_Folder(To_String(Out_Folder));
      File_Dir_Dialog.Show_All;
   end On_New_Project;

   -----------------------------------------------------------------------------
   -- Procedure On_Languages used in the File Languages command
   -----------------------------------------------------------------------------
   procedure On_Languages (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      Set_Active(Lan_Dialog.Combo_Inp, Lan_ID);
      Lan_Dialog.Show_All;
   end On_Languages;

   -----------------------------------------------------------------------------
   -- Procedure On_Full_Project used in the CR_Project Full_Project command
   -----------------------------------------------------------------------------
   procedure On_Full_Project (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      CR_Project_Names_Init.Dialog_Open := true;
      Set_Text(CR_Project_Names_Init.Main_Dialog.Template_Entry,
               To_String(last_template));
      Set_Text(CR_Project_Names_Init.Main_Dialog.Dialog_Entry,
               To_String(last_dialog));
      CR_Project_Names_Init.Main_Dialog.Show_All;
   end On_Full_Project;

   -----------------------------------------------------------------------------
   -- Procedure On_Only Dialog used in the CR_Project Only Dialog command
   -----------------------------------------------------------------------------
   procedure On_Only_Dialog (Object : access Gtk_Menu_Item_Record'Class) is
   begin
      CR_Project_DNames_Init.Dialog_Open := true;
      Set_Text(CR_Project_DNames_Init.Main_Dialog.Dialog_Entry,
               To_String(last_dialog));
      CR_Project_DNames_Init.Main_Dialog.Show_All;
   end On_Only_Dialog;

    -----------------------------------------------------------------------------
   -- Procedure On_About used in the Help About command
   -----------------------------------------------------------------------------
   procedure On_About (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_About;

end CR_Project_Main_CB;
