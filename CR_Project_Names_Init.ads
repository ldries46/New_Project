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
with Gtk.Widget;
with Gtk.Dialog;            use Gtk.Dialog;
with Gtk.Box;               use Gtk.Box;
with Gtk.Button;            use Gtk.Button;
with Gtk.Label;             use Gtk.Label;
with Gtk.GEntry;            use Gtk.GEntry;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package CR_Project_Names_Init is

   type Names_Record is new Gtk_Dialog_Record with record
      -- Main Bos
      Dialog_Box     : Gtk_Box;
      -- Input_Box
      Input_Box      : Gtk_Box;
      -- Box for normal Entry and Label
      InputT_Entry   : Gtk_Box;
      InputD_Entry   : Gtk_Box;
      -- Label and entry
      LabelT_Entry   : Gtk_Label;
      LabelD_Entry   : Gtk_Label;
      Template_Entry : Gtk_Entry;
      Dialog_Entry   : Gtk_Entry;
      -- Button Box
      Button_Box     : Gtk_Box;
      -- Space before buttons
      LabelB_But     : Gtk_Label;
      -- Buttons OK and Cancel
      OK             : Gtk_Button;
      Cancel         : Gtk_Button;
   end record;
   type Names_Access is access all Names_Record'Class;

   Dialogsize_H : Gint := 150;  -- Width of the dialog window
   Dialogsize_V : Gint := 80;   -- Height of the dialog window
   Main_Dialog  : Names_Access;
   Dialog_Open  : Boolean := false;

   procedure Gtk_New(MainDialog : out Names_Access);
   procedure Init(MainDialog : access Names_Record'Class);

end CR_Project_Names_Init;
