package Figuras is

   type Distancia is new Float;
   type Area is new Float;
   
   function "*" (Left:Distancia; Right:Distancia) return Area;
   function Calcular_Area_Triangulo(Base:Distancia; Altura : Distancia) return Area;

end Figuras;
