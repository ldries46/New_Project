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
with Gtk.Combo_Box_Text;               use Gtk.Combo_Box_Text;
with Program_Init;                     use Program_Init;
with CR_Project_Languages;             use CR_Project_Languages;
with CR_Project_Languages_Dialog_Init; use CR_Project_Languages_Dialog_Init;
with CR_Project_General;               use CR_Project_General;

--------------------------------------------------------------------------------
-- Change "CR_Project_Languages_DialogCB" in the name of the package                              --
--------------------------------------------------------------------------------
package body CR_Project_Languages_Dialog_CB is

   -----------------------------------------------------------------------------
   -- Procedure On Lan_Set used in the Destroy command
   -----------------------------------------------------------------------------
   procedure On_Lan_Set (Object : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Object);
   begin
      Lan_ID := Get_Active(Lan_Dialog.Combo_Inp);
      Lan := Ch_Languages(integer(Lan_ID));
      On_Lan_End(null);
      Set_Value(n_ini, "Languages", "Lan", Language'Image(Lan));
      Reload_Language(Lan);
   end On_Lan_Set;

   -----------------------------------------------------------------------------
   -- Procedure On Lan_End used in the Destroy command
   -----------------------------------------------------------------------------
   procedure On_Lan_End (Object : access Gtk_Button_Record'Class) is
      pragma Unreferenced (Object);
   begin
      if Lan_Dialog /= null then
         Lan_Dialog.Hide;
      end if;
   end On_Lan_End;

   -----------------------------------------------------------------------------
   -- Procedure On_DialogDelete_Event used in the Delete_Event
   -----------------------------------------------------------------------------
   function On_DialogDelete_Event (Object : access Gtk_Dialog_Record'Class;
                                    Event : Gdk.Event.Gdk_Event) return boolean is
      pragma Unreferenced (Object);
   begin
      On_Lan_End(null);
      return true;
   end On_DialogDelete_Event;

   -----------------------------------------------------------------------------
   -- On Cancel is used to leave the dialog without handling something        --
   -----------------------------------------------------------------------------

   ------------------------------------------------------------------
   -- Change "CR_Project_DialogCB" in the name of the package                             --
   --------------------------------------------------------------------------------
end CR_Project_Languages_Dialog_CB;
