pragma Ada_2012;
package body Figuras is

   ------------------
   -- CalcularArea --
   ------------------

   function CalcularArea (This : Rectangulo) return Area is
   Begin
     return Area(This.LadoA)*Area(This.LadoB);
   end;

   function CalcularArea (This : Triangulo) return Area is
   Begin
     return Area(This.Base)*Area(This.Altura) / 2.0;
   end;
end Figuras;
