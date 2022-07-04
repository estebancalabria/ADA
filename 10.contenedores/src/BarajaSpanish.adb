pragma Ada_2012;
with Ada.Text_IO;use Ada.Text_IO;

package body BarajaSpanish is

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (This : Carta) is
   begin
      Put_Line(This.Numero'Image & " de " & This.Palo'Image);
   end;

   function  "<" (A,B :PCarta) return Boolean is
   Begin
     return (A.Numero<B.Numero) or (A.Palo<B.Palo);
   end;


end BarajaSpanish;
