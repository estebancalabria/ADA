package Figuras is

   type Centimetros is new Float range 0.0..100.00;
   type Area is new Float range 0.0..1000.00;
   
   type Figura is tagged record
      X: Integer;
      Y: Integer;
   end record;
   procedure Dibujar(This:Figura);
   
   type Rectangulo is new Figura with
    record
      LadoA : Centimetros;
      LadoB : Centimetros;
    end record;
   function CalcularArea(This:Rectangulo) return Area;
   
   --El triangulo es igual, tiene X,Y y tiene Base y Altura, tambien un calcular Area
   type Triangulo is new Figura with   
     record
       Base : Centimetros;      
       Altura : Centimetros;   
     end record;
   function CalcularArea(This:Triangulo) return Area;
end Figuras;
