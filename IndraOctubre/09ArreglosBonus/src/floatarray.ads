package FloatArray is

   type Array_Float is private;

   function Arreglo_Numeros_Aleatorios(Num_N : in Integer) return Array_Float;
   
   function Sumatoria(Entrada:in Array_Float) return Float;
   
   function Promedio(Arreglo_Media : in Array_Float) return Float;
   
   procedure Mostrar (Arr : Array_Float);
   
   function Mayores(Arreglo : Array_Float; Valor : Float) return Array_Float;
   
private
   
   type Array_Float is Array(1..100) of Float;
   
end FloatArray;
