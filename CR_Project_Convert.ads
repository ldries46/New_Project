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

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package CR_Project_Convert is

   n_files : constant integer := 22;

   Files :  constant array (1 .. n_files) of Unbounded_String :=
     (To_Unbounded_String("Template.adb"),
      To_Unbounded_String("Template_General.ads"),
      To_Unbounded_String("Template_Main_Init.adb"),
      To_Unbounded_String("Template_Main_Init.ads"),
      To_Unbounded_String("Template_Main_CB.adb"),
      To_Unbounded_String("Template_Main_CB.ads"),
      To_Unbounded_String("Template_Languages.adb"),
      To_Unbounded_String("Template_Languages.ads"),
      To_Unbounded_String("Template_Languages_Dialog_Init.adb"),
      To_Unbounded_String("Template_Languages_Dialog_Init.ads"),
      To_Unbounded_String("Template_Languages_Dialog_CB.adb"),
      To_Unbounded_String("Template_Languages_Dialog_CB.ads"),
      To_Unbounded_String("Template_FC_Init.adb"),
      To_Unbounded_String("Template_FC_Init.ads"),
      To_Unbounded_String("Template_FC_CB.adb"),
      To_Unbounded_String("Template_FC_CB.ads"),
      To_Unbounded_String("Template_Dialog_Init.adb"),
      To_Unbounded_String("Template_Dialog_Init.ads"),
      To_Unbounded_String("Template_Dialog_CB.adb"),
      To_Unbounded_String("Template_Dialog_CB.ads"),
      To_Unbounded_String("Template.gpr"),
      To_Unbounded_String("Template.ico"));
   strD  : constant String := "Template_Dialog";
   strT  : constant String := "Template";

   procedure Conversion;

end CR_Project_Convert;
