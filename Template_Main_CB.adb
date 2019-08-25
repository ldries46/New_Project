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
with Glib; use Glib;
with Gtk.Main;
with Gtk.Tree_Model;
with Gtk.GEntry; use Gtk.GEntry;
with Gtk.Combo_Box_Text; use Gtk.Combo_Box_Text;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- If no Init Files are used then this call can be deleted
with Program_Init; use Program_Init;
-- With statements for Dialogs
with Template_Dialog_Init; with Template_Dialog_Init;
with Template_FC_Init; use Template_FC_Init;
with Template_Languages; use Template_Languages;
with Template_Languages_Dialog_Init; use Template_Languages_Dialog_Init;

package body Template_Main_CB is

   -----------------------------------------------------------------------------
   -- Internal procedure End_Program used in the Quit and Exit commands
   -----------------------------------------------------------------------------
   procedure End_Program is
   begin
      Close_Ini;
      Gtk.Main.Main_Quit;
   end End_Program;

   -----------------------------------------------------------------------------
   -- Internal procedure Stop ile chooser Buttons
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
   -- Procedure On_Open used in the File Open command
   -----------------------------------------------------------------------------
   procedure On_Open (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      File := Open;
      First_file := false;
      File_Open_Dialog.Show_All;
   end On_Open;

   -----------------------------------------------------------------------------
   -- Procedure Write_File which writes the file in bothSave and Save As cases
   -----------------------------------------------------------------------------
   procedure Write_File is
   begin
--      if Response = Gtk_Response_OK then
--         File_Name := To_Unbounded_String(Get_Current_Folder(File_Dialog));
         -- Open the file, write it and close it
         First_file := false;
--      end if;
   end Write_File;

    -----------------------------------------------------------------------------
   -- Procedure On_Save used in the File Save command
   -----------------------------------------------------------------------------
   procedure On_Save (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      if first_file then
         On_Save_As(null);
      else
         File := Save;
         Write_File;
      end if;
   end On_Save;

   -----------------------------------------------------------------------------
   -- Procedure On_Save_As used in the File Save As command
   -----------------------------------------------------------------------------
   procedure On_Save_As (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      File := Save;
      File_Save_Dialog.Show_All;
      Write_File;
   end On_Save_As;

   -----------------------------------------------------------------------------
   -- Procedure On_Print used in the File Print command
   -----------------------------------------------------------------------------
   procedure On_Print (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_Print;

   -----------------------------------------------------------------------------
   -- Procedure On_Print_Options used in the File Print Options command
   -----------------------------------------------------------------------------
   procedure On_Print_Options (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_Print_Options;

   -----------------------------------------------------------------------------
   -- Procedure On_Properties used in the File Properties command
   -----------------------------------------------------------------------------
   procedure On_Properties (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_Properties;

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
   -- Procedure On_Cut used in the Edit Cut command
   -----------------------------------------------------------------------------
   procedure On_Cut (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_Cut;

  -----------------------------------------------------------------------------
   -- Procedure On_Copy used in the Edit Copy command
   -----------------------------------------------------------------------------
   procedure On_Copy (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_Copy;

   -----------------------------------------------------------------------------
   -- Procedure On_Paste used in the Edit Paste command
   -----------------------------------------------------------------------------
   procedure On_Paste (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_Paste;

   -----------------------------------------------------------------------------
   -- Procedure On_Delete used in the Edit Delete command
   -----------------------------------------------------------------------------
   procedure On_Delete (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_Delete;

   -----------------------------------------------------------------------------
   --                                                                         --
   -- At this position the various user callback routines will be posiyionned --
   --                                                                         --
   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   -- Procedure On_Test used in the Template Test command
   -- This routine will be replaced by various others
   -----------------------------------------------------------------------------
   procedure On_Test (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
      n    : integer := 0;
      str  : Unbounded_String;
   begin
      Template_Dialog_Init.Dialog_Open := true;
--      Set_Text(Template_Dialog_Init.Main_Dialog.Str_Entry,
--               To_String(Template_Dialog_Init.last_txt));
      Template_Dialog_Init.Main_Dialog.Check_But.Set_active(Template_Dialog_Init.mode);
      Template_Dialog_Init.Main_Dialog.Radio1_But.Set_Active(Template_Dialog_Init.mode_Radio1);
      Template_Dialog_Init.Main_Dialog.Radio2_But.Set_Active(Template_Dialog_Init.mode_Radio2);
      Template_Dialog_Init.Main_Dialog.Radio3_But.Set_Active(Template_Dialog_Init.mode_Radio3);
      --------------------------------------------------------------------------
      -- Example of filling a combobox                                        --
      --------------------------------------------------------------------------
      Remove_All(Template_Dialog_Init.Main_Dialog.Str_Combo);
      while n < 10 loop
        str := To_Unbounded_String(integer'Image(n));
         Append_Text(Template_Dialog_Init.Main_Dialog.Str_Combo,
                     To_String(str));
         n := n + 1;
      end loop;
      Set_Active(Template_Dialog_Init.Main_Dialog.Str_Combo,
                 Template_Dialog_Init.n_ID);
      Template_Dialog_Init.Main_Dialog.Show_All;
   end On_Test;

    -----------------------------------------------------------------------------
   -- Procedure On_About used in the Help About command
   -----------------------------------------------------------------------------
   procedure On_About (Object : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Object);
   begin
      null;
   end On_About;

end Template_Main_CB;
