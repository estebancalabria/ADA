package body Figuras is

   function "*" (Left:Distancia; Right:Distancia) return Area is
   begin
      return Area(Left) * Area(Right);
   end;
   
   function Calcular_Area_Triangulo(Base:Distancia; Altura : Distancia) return Area is
   begin
      return Base * Altura / 2.0;
   end;

end Figuras;
