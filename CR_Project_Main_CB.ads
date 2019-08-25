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
with Gdk.Event;             use Gdk.Event;
with Gtk.Window;            use Gtk.Window;
with Gtk.Menu_Item;         use Gtk.Menu_Item;
with Gtk.Dialog;            use Gtk.Dialog;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with CR_Project_General;    use CR_Project_General;

package CR_Project_Main_CB is

   First_File    : boolean := true;
   File          : File_Status;

   -- Exit of the program (Any reason)
   procedure On_Window_Destroy (Object : access Gtk_Menu_Item_Record'Class);
   function On_Window_Delete_Event (Object : access Gtk_Window_Record'Class;
                                    Event : Gdk.Event.Gdk_Event) return boolean;
   procedure On_New (Object : access Gtk_Menu_Item_Record'Class);
   procedure On_Source_Dir (Object : access Gtk_Menu_Item_Record'Class);
   procedure On_New_Project (Object : access Gtk_Menu_Item_Record'Class);
   procedure On_Languages (Object : access Gtk_Menu_Item_Record'Class);
   procedure On_Full_Project (Object : access Gtk_Menu_Item_Record'Class);
   procedure On_Only_Dialog (Object : access Gtk_Menu_Item_Record'Class);
   procedure On_About (Object : access Gtk_Menu_Item_Record'Class);

end CR_Project_Main_CB;
