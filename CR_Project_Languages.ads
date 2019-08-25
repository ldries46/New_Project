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
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with CR_Project_General;    use CR_Project_General;

package CR_Project_Languages is

   type Language is (GB_USA, NL_B, F_B, D, ES);

      Lan_ID         : Gint := 0;

   -----------------------------------------------------------------------------
   --                                                                         --
   -- If not all languages are wanted nr_languages must be altered and in     --
   -- CH_Lanuages CH_Languages the not wanted languages must be deleted       --
   --                                                                         --
   -----------------------------------------------------------------------------
   nr_languages      : constant integer := 5;

   type ar_lan is array (0 .. nr_languages - 1) of Language;

   Lan               : Language := GB_USA;
   CH_Languages      : constant ar_lan := (GB_USA, NL_B, F_B, D, ES);

   -- Languages Names
   Language_Names    : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("English"), To_Unbounded_String("Nederlands"),
      To_Unbounded_String("Francais"), To_Unbounded_String("Deutsch"),
      To_Unbounded_String("Espagnol"));
   -- Titles
   Lan_Window_Title  : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("CR_Project Program"),
      To_Unbounded_String("CR_Project Programma"),
      To_Unbounded_String("CR_Project "), To_Unbounded_String("CR_Project "),
      To_Unbounded_String("CR_Project "));
   Lan_Full_Title  : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Full Template Conversion "),
      To_Unbounded_String("Volledige Voorbeeld Conversie "),
      To_Unbounded_String("Conversion de modèle complet "),
      To_Unbounded_String("Vollständige Vorlage Conversion "),
      To_Unbounded_String("Conversión plantilla completa "));
   Lan_Dialog_Title : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Dialog Template Conversion "),
      To_Unbounded_String("Dialoog Voorbeeld Conversie "),
      To_Unbounded_String("Conversion de modèle dialogue "),
      To_Unbounded_String("Dialog Vorlage Conversion "),
      To_Unbounded_String("Conversión plantilla diálogo "));

   -- Menu
   Lan_File           : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("_File"), To_Unbounded_String("_Bestanden"),
      To_Unbounded_String("Fichier"), To_Unbounded_String("Datei"),
      To_Unbounded_String("Archivo"));
   Lan_Create         : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Create Project Files"), To_Unbounded_String("Maak Project Files"),
      To_Unbounded_String("Create Project Files"), To_Unbounded_String("Erstellen Sie Projektdateien"),
      To_Unbounded_String("Crear archivos de proyecto"));
   Lan_Help           : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("_Help"), To_Unbounded_String("Hulp"),
      To_Unbounded_String("Aide"), To_Unbounded_String("Hilfe"),
      To_Unbounded_String("Ayuda"));
   Lan_New            : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("New"), To_Unbounded_String("Nieuw"),
      To_Unbounded_String("Nouveau"), To_Unbounded_String("Neu"),
      To_Unbounded_String("Nuevo"));
   Lan_Open           : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Open"), To_Unbounded_String("Open"),
      To_Unbounded_String("Ouvrir"), To_Unbounded_String("Ofnen"),
      To_Unbounded_String("Abierto"));
   Lan_Save           : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Save"), To_Unbounded_String("Opslaan"),
      To_Unbounded_String("Sauvegarder"), To_Unbounded_String("Speichern"),
      To_Unbounded_String("Guardar"));
   Lan_Language    : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Languages"), To_Unbounded_String("Talen (Languages)"),
      To_Unbounded_String(" (Languages)"), To_Unbounded_String("Sprachen (Languages)"),
      To_Unbounded_String(" (Languages)"));
   Lan_Quit           : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Quit"), To_Unbounded_String("Afsluiten"),
      To_Unbounded_String("Quitter"), To_Unbounded_String("Verlassen"),
      To_Unbounded_String("Dejar"));
   Lan_Total         : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Complete Project"), To_Unbounded_String("Volledig Project"),
      To_Unbounded_String(""), To_Unbounded_String(""),
      To_Unbounded_String(""));
   Lan_Dial          : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Dialog Only"), To_Unbounded_String("Alleen Dialoog"),
      To_Unbounded_String("Dialogue uniquement"), To_Unbounded_String("Nur Dialog"),
      To_Unbounded_String("Sólo diálogo"));
   Lan_About        : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("About"), To_Unbounded_String("Over"),
      To_Unbounded_String("Sur"), To_Unbounded_String("Über"),
      To_Unbounded_String("Acerca de"));

   --Buttons
   Lan_OK           : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("OK"), To_Unbounded_String("OK"),
      To_Unbounded_String("OK"), To_Unbounded_String("OK"),
      To_Unbounded_String("OK"));
   Lan_Cancel         : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Cancel"), To_Unbounded_String("Annuleren"),
      To_Unbounded_String("Annuler"), To_Unbounded_String("Abbrechen"),
      To_Unbounded_String("Cancelar"));
   Lan_Open_But       : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Open"), To_Unbounded_String("Open"),
      To_Unbounded_String("Ouvrir"), To_Unbounded_String("Öffnen"),
      To_Unbounded_String("Abierto"));
   Lan_Save_but       : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Save"), To_Unbounded_String("Opslaan"),
      To_Unbounded_String("Sauvegarder"), To_Unbounded_String("Speichern"),
      To_Unbounded_String("Guardar"));
   Lan_Set            : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Set"), To_Unbounded_String("Zet"),
      To_Unbounded_String("Tourner"), To_Unbounded_String("Wende an"),
      To_Unbounded_String("Vuelta"));

   -- CR_Project Strings
   Lan_Header       : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("Details of the program progress:") & CRLF,
      To_Unbounded_String("Details van de programma voortgang:") & CRLF,
      To_Unbounded_String("Les détails de l'état d'avancement du programme:") & CRLF,
      To_Unbounded_String("Einzelheiten des Programms Fortschritte:") & CRLF,
      To_Unbounded_String("Los detalles del progreso del programa:") & CRLF);
    Lan_Source      : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("The Source Dirctory is : "),
      To_Unbounded_String("De oorsprong folder is : "),
      To_Unbounded_String("La Directory Originale est : "),
      To_Unbounded_String("Das Quell folder ist : "),
      To_Unbounded_String("El directorio de origen es : "));
    Lan_Dest        : constant array(GB_USA .. ES) of Unbounded_String :=
     (To_Unbounded_String("The Destination Dirctory is : "),
      To_Unbounded_String("De output folder is : "),
      To_Unbounded_String("La Directory Sortie est : "),
      To_Unbounded_String("Das Quell folder ist : "),
      To_Unbounded_String("El directorio de salida es : "));

  procedure Reload_Language(l : Language);

end CR_Project_Languages;
