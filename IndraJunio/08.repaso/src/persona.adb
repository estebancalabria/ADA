pragma Ada_2012;

with Ada.Text_IO; use Ada.Text_IO;
package body persona is

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (This : TPersona) is
   begin
      Put_Line("Soy " & To_String(This.Nombre) & " de " & This.Edad'Image & " años.");
   end;


   --------------------
   -- FestejarCumple --
   --------------------

   procedure FestejarCumple (This :  in out  TPersona) is
   begin
      This.Edad := This.Edad + 1;
   end;


end persona;
