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
with Glib;                  use Glib;
with Gtk.GEntry;            use Gtk.GEntry;
with CR_Project_DNames_Init;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with CR_Project_General;    use CR_Project_General;
with CR_Project_Convert;    use CR_Project_Convert;

package body CR_Project_DNames_CB is

   -----------------------------------------------------------------------------
   -- Procedure On Dialog_End used in the Destroy command                     --
   -----------------------------------------------------------------------------
   procedure On_DNames_End (Object : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Object);
   begin
      if CR_Project_DNames_Init.Dialog_Open then
         CR_Project_DNames_Init.Main_Dialog.Hide;
         CR_Project_DNames_Init.Dialog_Open := false;
      end if;
   end On_DNames_End;

   -----------------------------------------------------------------------------
   -- Procedure On_Dialog_Delete_Event used in the Delete_Event               --
   -----------------------------------------------------------------------------
   function On_DNames_Delete_Event (Object : access Gtk_Dialog_Record'Class;
                                    Event : Gdk.Event.Gdk_Event) return boolean is
      pragma Unreferenced (Object);
   begin
      On_DNames_End(null);
      return true;
   end On_DNames_Delete_Event;

   -----------------------------------------------------------------------------
   -- On OK is used to leave the dialog with handling something               --
   -----------------------------------------------------------------------------
   procedure On_DOK(Object : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Object);
   begin
      -- Readout of the varius Parameters of the Dialog
      last_dialog := To_Unbounded_String(Get_Text(CR_Project_DNames_Init.Main_Dialog.Dialog_Entry));
      Type_conv := Dialog;
      On_DNames_End(null);
      Conversion;
   end On_DOK;

end CR_Project_DNames_CB;
