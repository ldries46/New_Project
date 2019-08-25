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
with Gtk.File_Chooser_Dialog; use Gtk.File_Chooser_Dialog;
with Program_Init; use Program_Init;
with CR_Project_Main_CB; use CR_Project_Main_CB;
with CR_Project_FC_Init; use CR_Project_FC_Init;
with CR_Project_General; use CR_Project_General;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with CR_Project_Main_Init; use CR_Project_Main_Init;
with CR_Project_Languages; use CR_Project_Languages;

Package body CR_Project_FC_CB is

   procedure On_FC_Open_OK (Object : access Gtk_Button_Record'Class) is
      str : Unbounded_String;
   begin
      Inp_Folder := To_Unbounded_String(Get_Current_Folder(File_Dir_Dialog));
      str := Lan_Source(Lan) & Inp_Folder & CRLF;
      Main_Window.Buffer.Insert_At_Cursor(To_String(str));
      Set_Value (n_ini, "Directory", "Input", To_String(Inp_Folder));
      File_Dir_Dialog.Hide;
   end On_FC_Open_OK;

   procedure On_FC_Save_OK (Object : access Gtk_Button_Record'Class) is
      str : Unbounded_String;
   begin
      Out_Folder := To_Unbounded_String(Get_Current_Folder(File_Dir_Dialog));
      str := Lan_Dest(Lan) & Out_Folder & CRLF;
      Main_Window.Buffer.Insert_At_Cursor(To_String(str));
      Set_Value (n_ini, "Directory", "Output", To_String(Out_Folder));
      File_Dir_Dialog.Hide;
   end On_FC_Save_OK;

   procedure On_FC_Dir_OK (Object : access Gtk_Button_Record'Class) is
      str : Unbounded_String;
   begin
      case File is
         when Open => On_FC_Open_OK(null);
         when Save => On_FC_Save_OK(null);
         when Dir => File_Dir_Dialog.Hide;
      end case;
   end On_FC_Dir_OK;

   procedure On_FC_Cancel (Object : access Gtk_Button_Record'Class) is
   begin
      case File is
         when Open => File_Open_Dialog.Hide;
         when Save => File_Save_Dialog.Hide;
         when Dir => File_Dir_Dialog.Hide;
      end case;
   end On_FC_Cancel;

end CR_Project_FC_CB;
