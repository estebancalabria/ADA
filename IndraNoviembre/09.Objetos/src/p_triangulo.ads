package P_Triangulo is

   type C_Triangulo is tagged record
      Base : Float;
      Altura : Float;
   end record;  
   type Triangulo is access C_Triangulo'Class;
   
   function Calcular_Area(This:C_Triangulo) return Float;

end P_Triangulo;
