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
with Gtk.Window; use Gtk.Window;
with Gtk.Menu_Item; use Gtk.Menu_Item;
with Gtk.Dialog; use Gtk.Dialog;
with Gtk.Button; use Gtk.Button;
with Template_Main_Init; use Template_Main_Init;
with Template_Dialog_Init;
with Template_FC_Init; use Template_FC_Init;
with Template_Languages_Dialog_Init; use Template_Languages_Dialog_Init;
with Template_Languages_Dialog_CB; use Template_Languages_Dialog_CB;

package body Template_Languages is

   procedure Reload_Language(l : Language) is
      n : Integer := 0;
      b : boolean := false;
   begin
      while not b and n < nr_languages loop
         b := Ch_Languages(n) = l;
         n := n + 1;
      end loop;
      if not b then
         raise Constraint_Error;
      else
         Lan := l;
      end if;
      -- Titles
      Main_Window.Set_Title(To_String(Lan_Window_Title(Lan)));
      Template_Dialog_Init.Main_Dialog.Set_Title (To_String(Lan_Dialog_Title(Lan)));
      -- Menu Items
      Main_Window.File.Set_Label(To_String(Lan_File(Lan)));
      Main_Window.New_Project.Set_Label(To_String(Lan_New(Lan)));
      Main_Window.Open.Set_Label(To_String(Lan_Open(Lan)));
      Main_Window.Save.Set_Label(To_String(Lan_Save(Lan)));
      Main_Window.Save_As.Set_Label(To_String(Lan_Save_As(Lan)));
      Main_Window.Print.Set_Label(To_String(Lan_Print(Lan)));
      Main_Window.Print_Options.Set_Label(To_String(Lan_Print_Option(Lan)));
      Main_Window.Properties.Set_Label(To_String(Lan_Properties(Lan)));
      Main_Window.Languages.Set_Label(To_String(Lan_Language(Lan)));
      Main_Window.Quit.Set_Label(To_String(Lan_Quit(Lan)));
      Main_Window.Edit.Set_Label(To_String(Lan_Edit(Lan)));
      Main_Window.Cut.Set_Label(To_String(Lan_Cut(Lan)));
      Main_Window.Copy.Set_Label(To_String(Lan_Copy(Lan)));
      Main_Window.Paste.Set_Label(To_String(Lan_Paste(Lan)));
      Main_Window.Delete.Set_Label(To_String(Lan_Delete(Lan)));
      Main_Window.View.Set_Label(To_String(Lan_View(Lan)));
      Main_Window.Help.Set_Label(To_String(Lan_Help(Lan)));
      Main_Window.About.Set_Label(To_String(Lan_About(Lan)));
      -- Buttons
      -- Filechooser dialogs
      FC_Open_OK.Set_Label(To_String(Lan_Open(Lan)));
      FC_Open_Cancel.Set_Label(To_String(Lan_Cancel(Lan)));
      FC_Save_OK.Set_Label(To_String(Lan_Save(Lan)));
      FC_Save_Cancel.Set_Label(To_String(Lan_Cancel(Lan)));
      FC_Dir_OK.Set_Label(To_String(Lan_Set(Lan)));
      FC_Dir_Cancel.Set_Label(To_String(Lan_Cancel(Lan)));
      -- Template_Main Dialog
      Template_Dialog_Init.Main_Dialog.OK.Set_Label(To_String(Lan_OK(Lan)));
      Template_Dialog_Init.Main_Dialog.Cancel.Set_Label(To_String(Lan_Cancel(Lan)));
      -- Language Dialog
      Lan_Dialog.OK.Set_Label(To_String(Lan_OK(Lan)));
      Lan_Dialog.Cancel.Set_Label(To_String(Lan_Cancel(Lan)));
      Lan_Dialog.Combo_Label.Set_Label(To_String(Lan_Language(Lan)));
   end Reload_Language;

end Template_Languages;
