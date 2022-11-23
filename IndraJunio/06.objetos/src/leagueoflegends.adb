pragma Ada_2012;

with Ada.Text_IO;

package body LeagueOfLegends is

   ----------------------
   -- GanarExperiencia --
   ----------------------

   procedure GanarExperiencia (This :in out Heroe; XP : Experiencia) is
   Begin
      This.PuntosExperiencia := This.PuntosExperiencia + XP;

      if (this.PuntosExperiencia > (Experiencia(This.NivelActual) * Experiencia(1000))) then
         This.NivelActual := This.NivelActual + 1;
      end if;

   end;

   -----------------
   -- MostrarInfo --
   -----------------

   procedure MostrarInfo (This : Heroe) is
   use Ada.Text_IO;
   Begin
      Put_Line("Soy " & This.Nombre'Image
               & " nivel " & This.NivelActual'Image
               & "[Vida : " & This.PuntosDeVidaMaximos'Image
               & " XP : " & This.PuntosExperiencia'Image & "]" );
   end;

end LeagueOfLegends;
