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
with Glib;                    use Glib;
with Glib.Error;              use Glib.Error;
with Glib.Object;             use Glib.Object;
with Glib.Values;             use Glib.Values;
with Gtk ;                    use Gtk;
with Gtk.Window;              use Gtk.Window;
with Gtk.Button;              use Gtk.Button;
with Gtk.Box;                 use Gtk.Box;
with Gtk.Menu_Bar;            use Gtk.Menu_Bar;
with Gtk.Menu_Item;           use Gtk.Menu_Item;
with Gtk.Separator_Menu_Item; use Gtk.Separator_Menu_Item;
with Gtk.Menu;                use Gtk.Menu;
with Gtk.Scrolled_Window;     use Gtk.Scrolled_Window;
with Gtk.Text_View;           use Gtk.Text_View;
with Gtk.Text_Buffer;         use Gtk.Text_Buffer;
with Gtk.Text_Iter;           use Gtk.Text_Iter;
with Gtk.Status_Bar;          use Gtk.Status_Bar;
with Gtk.Button;              use Gtk.Button;
with Gtkada.Dialogs;          use Gtkada.Dialogs;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;

--------------------------------------------------------------------------------
-- Use the next line dor everyDialog window                                   --
-- Change the name to use a fifferent Dialog name for every dislog            --
--------------------------------------------------------------------------------
with CR_Project_Names_Init; use CR_Project_Names_Init;

package CR_Project_Main_Init is

   type Main_Window_Record is new Gtk_Window_Record with record
      Main_Box1        : Gtk_Box;
      Main_Bar         : Gtk_Menu_Bar;            -- Menubar
      File             : Gtk_Menu_Item;           -- File Menu in Menubalk
      File_Menu        : Gtk_Menu;
      New_Project      : Gtk_Menu_Item;           -- New in File menu
      Open             : Gtk_Menu_Item;           -- Open in File menu
      Save             : Gtk_Menu_Item;           -- Save in File menu
      Separator1       : Gtk_Separator_Menu_Item;
      Languages        : Gtk_Menu_Item;           -- Lanmguages in File menu
      Separator2       : Gtk_Separator_Menu_Item;
      Quit             : Gtk_Menu_Item;           -- Quit in File menu
      CR_Project       : Gtk_Menu_Item;           -- CR_Project Menu in Menubalk
      CR_Project_Menu  : Gtk_Menu;
      Full             : Gtk_Menu_Item;           -- CR_Project Menu in Menubalk
      Dial             : Gtk_Menu_Item;           -- CR_Project Menu in Menubalk
      Help             : Gtk_Menu_Item;           -- Help Menu in Menubalk
      Help_Menu        : Gtk_Menu;
      About            : Gtk_Menu_Item;           -- About in Help menu
      Scrolledwindow   : Gtk_Scrolled_Window;
      Textview         : Gtk_Text_View;           -- Textview Part
      Buffer           : Gtk_Text_Buffer;         -- Text_Buffer
      BufferD          : Gtk_Text_Buffer;         -- Text_Buffer
      Statusbar        : Gtk_Status_Bar;          -- Statusbar
   end record;
   type Main_Window_Access is access all Main_Window_Record'Class;

   Mainsize_H  : Gint := 760;  -- Width of the main window
   Mainsize_V  : Gint := 670;  -- Height of the main window
   Main_Window : Main_Window_Access;

   procedure Gtk_New(MainWindow : out Main_Window_Access);
   procedure Init(MainWindow : access Main_Window_Record'Class);

end CR_Project_Main_Init;
