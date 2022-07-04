pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
package body Figuras is

   procedure Dibujar(This:Figura) is
   begin

      Put_Line("Soy una Figura en " & This.X'Image & "," & This.Y'Image);
   end;

   function CalcularArea (This : Rectangulo) return Area is
   Begin
     return Area(This.LadoA)*Area(This.LadoB);
   end;

   function CalcularArea (This : Triangulo) return Area is
   Begin
     return Area(This.Base)*Area(This.Altura) / 2.0;
   end;

   function CalcularArea(This:Circulo) return Area is
   begin
      return area(3.14)*(area(This.radio**2));
   end;
end Figuras;
