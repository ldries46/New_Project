------------------------------------------------------------------------------
--                                                                          --
--      Copyright (C) 2016 L. Dries                                         --
--                                                                          --
-- This library is free software;  you can redistribute it and/or modify it --
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
-- Version 1.00 dd. 06-07-2016 created by L. Dries                          --
------------------------------------------------------------------------------

pragma License(Unrestricted);
with Glib; use Glib;
with Gtk.Widget;
with Gtk.Dialog; use Gtk.Dialog;
with Gtk.Box; use Gtk.Box;
with Gtk.Button; use Gtk.Button;
--------------------------------------------------------------------------------
-- Only necessary if comboxes are used                                        --
--------------------------------------------------------------------------------
with Gtk.Label; use Gtk.Label;
with Gtk.GEntry; use Gtk.GEntry;
with Gtk.List_Store; use Gtk.List_Store;
with Gtk.Combo_Box_Text; use Gtk.Combo_Box_Text;
with Gtk.Check_Button; use Gtk.Check_Button;
with Gtk.Radio_Button; use Gtk.Radio_Button;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

--------------------------------------------------------------------------------
-- Change "CR_Project_Dialog_Init" in the name of the package                   --
--------------------------------------------------------------------------------
package CR_Project_DNames_Init is

   type DNames_Record is new Gtk_Dialog_Record with record
      --------------------------------------------------------------------------
      --                                                                      --
      -- Main Box                                                             --
      --                                                                      --
      --------------------------------------------------------------------------
      Dialog_Box     : Gtk_Box;
      --------------------------------------------------------------------------
      --                                                                      --
      -- Input_Box                                                            --
      --                                                                      --
      --------------------------------------------------------------------------
      Input_Box      : Gtk_Box;
      --------------------------------------------------------------------------
      --                                                                      --
      -- Box for normal Entry and Label                                       --
      --                                                                      --
      --------------------------------------------------------------------------
      InputD_Entry    : Gtk_Box;
      --------------------------------------------------------------------------
      --                                                                      --
      -- Label and entry                                                      --
      --                                                                      --
      --------------------------------------------------------------------------
      LabelD_Entry    : Gtk_Label;
      --------------------------------------------------------------------------
      --                                                                      --
      -- Box for the Combobox and label                                       --
      --                                                                      --
      --------------------------------------------------------------------------
      Dialog_Entry   : Gtk_Entry;
      --------------------------------------------------------------------------
      --                                                                      --
      -- Button Box                                        --
      --                                                                      --
      --------------------------------------------------------------------------
      Button_Box     : Gtk_Box;
      --------------------------------------------------------------------------
      -- Space before buttons
      --------------------------------------------------------------------------
      LabelB_But     : Gtk_Label;
      --------------------------------------------------------------------------
      --                                                                      --
      -- Buttons OK and Cancel                                                --
      --                                                                      --
      --------------------------------------------------------------------------
      OK             : Gtk_Button;
      Cancel         : Gtk_Button;
   end record;
   type DNames_Access is access all DNames_Record'Class;

   Dialogsize_H : Gint := 150;  -- Width of the dialog window
   Dialogsize_V : Gint := 80;   -- Height of the dialog window
   Main_Dialog  : DNames_Access;
   Dialog_Open  : Boolean := false;
   -----------------------------------------------------------------------------
   --                                                                         --
   -- Parameters for Entry boxes                                                --
   --                                                                         --
   -----------------------------------------------------------------------------

   procedure Gtk_New(MainDialog : out DNames_Access);
   procedure Init(MainDialog : access DNames_Record'Class);

--------------------------------------------------------------------------------
-- Change "CR_Project_Dialog_Init" in the name of the package                             --
--------------------------------------------------------------------------------
end CR_Project_DNames_Init;
