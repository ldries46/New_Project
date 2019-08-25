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
-- Version 1.00 dd. 19-07-2016 created by L. Dries                          --
------------------------------------------------------------------------------
-- Created from emplate V1.00 by L. Dries on 19-07-2016                     --
------------------------------------------------------------------------------

with GNAT.OS_Lib;           use GNAT.OS_Lib;
with Ada.Calendar;          use Ada.Calendar;
with Ada.Directories;       use Ada.Directories;
with Ada.Exceptions;        use Ada.Exceptions;
with Sequential_IO;
with Text_IO;               use Text_IO;
with CR_Project_Main_Init;  use CR_Project_Main_Init;
with CR_Project_General;    use CR_Project_General;
with CR_Project_Names_Init; use CR_Project_Names_Init;


package body CR_Project_Convert is

   type Byte is range 0 .. 255;

   procedure Conversion is

      package Byte_IO is new Sequential_IO(Byte);

      n            : integer;
      start        : integer;
      eind         : integer;
      position     : integer;
      Filenaam_In  : Unbounded_String;
      Filenaam_Out : Unbounded_String;
      Bld_Folder   : Unbounded_String;
      str          : Unbounded_String;
      line         : Unbounded_String;
      Date         : Unbounded_String;
      Text_In      : Text_IO.File_Type;
      Text_out     : Text_IO.File_Type;
      Byte_In      : Byte_IO.File_Type;
      Byte_Out     : Byte_IO.File_Type;
      File_Byte    : Byte;
      Year         : Year_Number;
      Month        : Month_Number;
      Day          : Day_Number;
      Rest         : Day_Duration;

   begin
      if Type_conv = Full then
         start := 1;
         eind  := n_files - 1;
      else
         start := 17;
         eind  := n_files - 2;
      end if;
      Split(Clock, Year, Month, Day, Rest);
      Date := To_Unbounded_String(Day_Number'Image(Day) & '-' &
                                  Month_Number'Image(Month) & '-' &
                                  Year_Number'Image(Year));
      n := start;
      if not Exists(To_String(Out_Folder)) then
         Create_Directory(To_String(Out_Folder));
      end if;
      Bld_Folder := Out_Folder & Directory_Separator & "build";
      if not Exists(To_String(Bld_Folder)) then
         Create_Directory(To_String(Bld_Folder));
      end if;
      while n <= eind loop
         Filenaam_In := Inp_Folder & Directory_Separator & Files(n);
         position := Index(Files(n), strD);
         if position /= 0 then
            Filenaam_Out := Replace_Slice(Files(n),position, position + 14, To_String(last_dialog));
         else
            position := Index(Files(n), StrT);
            if position /= 0 then
               Filenaam_Out := Replace_Slice(Files(n),position, position + 7, To_String(last_template));
            end if;
         end if;
         Filenaam_Out := Out_Folder & Directory_Separator & FileNaam_Out;
         str := Filenaam_In & " --> " & Filenaam_Out;
         Main_Window.Buffer.Insert_At_Cursor(To_String(str));
         -- read and write File
         Open(Text_In, In_File, To_String(FileNaam_In));
         Create(text_Out, Out_File, To_String(Filenaam_Out));
         while not End_Of_File(Text_In) loop
            line := To_Unbounded_String(Get_Line(Text_In));
            position := Index(line, "dd-mmm-yyyy");
            if position /= 0 then
               line := Replace_Slice(line,position, position + 10, To_String(Date));
            end if;
            loop
               position := Index(line, strD);
               if position /= 0 then
                  line := Replace_Slice(line,position, position + 14, To_String(last_dialog));
               else
                  exit;
               end if;
            end loop;
            loop
               position := Index(line, StrT);
               if position /= 0 then
                  line := Replace_Slice(line,position, position + 7, To_String(last_template));
               else
                  exit;
               end if;
            end loop;
            Put_Line(Text_Out, To_String(line));
         end loop;
         Close(Text_In);
         Close(Text_Out);
        str := To_Unbounded_String(" Completed ") & CRLF;
        Main_Window.Buffer.Insert_At_Cursor(To_String(str));
         n := n + 1;
      end loop;
      Filenaam_In := Inp_Folder & Directory_Separator & Files(n_files);
      position := Index(Files(n), strD);
      if Type_conv = Full then
         position := Index(Files(n), StrT);
         if position /= 0 then
            Filenaam_Out := Replace_Slice(Files(n_files),position, position + 7, To_String(last_template));
         end if;
         Filenaam_Out := Out_Folder & Directory_Separator & FileNaam_Out;
         str := Filenaam_In & " --> " & Filenaam_Out;
         Main_Window.Buffer.Insert_At_Cursor(To_String(str));
         Byte_IO.Open(Byte_In, Byte_IO.In_File, To_String(Filenaam_In));
         Byte_IO.Create(Byte_Out, Byte_IO.Out_File, To_String(Filenaam_Out));
         while not Byte_IO.End_Of_File(Byte_In) loop
            Byte_IO.Read(Byte_In, File_Byte);
            Byte_IO.Write(Byte_Out, File_Byte);
         end loop;
         Byte_IO.Close(Byte_In);
         Byte_IO.Close(Byte_Out);
      end if;
   exception
      when Error : others =>
         str := CRLF & "Exception: " & To_Unbounded_String(Exception_Name(Error)) & CRLF;
         Main_Window.Buffer.Insert_At_Cursor(To_String(str));
         str := "Input File" & Filenaam_In & CRLF;
         Main_Window.Buffer.Insert_At_Cursor(To_String(str));
         str := "Output File" & Filenaam_Out & CRLF;
         Main_Window.Buffer.Insert_At_Cursor(To_String(str));
         str := To_Unbounded_String(Exception_Message(Error)) & CRLF;
         Main_Window.Buffer.Insert_At_Cursor(To_String(str));
   end Conversion;

end CR_Project_Convert;
