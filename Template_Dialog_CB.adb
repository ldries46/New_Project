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
-- Created from Template V1.00 by L. Dries on 01-06-2019                    --
------------------------------------------------------------------------------

pragma License(Unrestricted);
with Glib; use Glib;
with Gtk.GEntry; use Gtk.GEntry;
with Template_Dialog_Init;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Template_Dialog_CB is

   -----------------------------------------------------------------------------
   -- Procedure On Dialog_End used in the Destroy command
   -----------------------------------------------------------------------------
   procedure On_Dialog_End (Object : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Object);
   begin
      if Template_Dialog_Init.Dialog_Open then
         Template_Dialog_Init.Main_Dialog.Hide;
         Template_Dialog_Init.Dialog_Open := false;
      end if;
   end On_Dialog_End;

   -----------------------------------------------------------------------------
   -- Procedure On_Dialog_Delete_Event used in the Delete_Event
   -----------------------------------------------------------------------------
   function On_Dialog_Delete_Event (Object : access Gtk_Dialog_Record'Class;
                                    Event : Gdk.Event.Gdk_Event) return boolean is
      pragma Unreferenced (Object);
   begin
      On_Dialog_End(null);
      return true;
   end On_Dialog_Delete_Event;

   -----------------------------------------------------------------------------
   -- On OK is used to leave the dialog with handling something        --
   -----------------------------------------------------------------------------
   procedure On_OK(Object : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Object);
   begin
      --------------------------------------------------------------------------
      --                                                                      --
      -- Readout of the varius Parameters of the Dialog                       --
      --                                                                      --
      --------------------------------------------------------------------------
      Template_Dialog_Init.mode := Template_Dialog_Init.Main_Dialog.Check_But.Get_Active;
      Template_Dialog_Init.mode_Radio1 := Template_Dialog_Init.Main_Dialog.Radio1_But.Get_Active;
      Template_Dialog_Init.mode_Radio2 := Template_Dialog_Init.Main_Dialog.Radio2_But.Get_Active;
      Template_Dialog_Init.mode_Radio3 := Template_Dialog_Init.Main_Dialog.Radio3_But.Get_Active;
      Template_Dialog_Init.n_ID := Get_Active(Template_Dialog_Init.Main_Dialog.Str_Combo);
      Template_Dialog_Init.last_txt1 := To_Unbounded_String(Get_Text(Template_Dialog_Init.Main_Dialog.Str_Line1));
      Template_Dialog_Init.last_txt2 := To_Unbounded_String(Get_Text(Template_Dialog_Init.Main_Dialog.Str_Line2));
      On_Dialog_End(null);
   end On_OK;

   -----------------------------------------------------------------------------
   -- On Cancel is used to leave the dialog without handling something        --
   -----------------------------------------------------------------------------

   ------------------------------------------------------------------
   -- Change "Template_Dialog_CB" in the name of the package                             --
   --------------------------------------------------------------------------------
end Template_Dialog_CB;
