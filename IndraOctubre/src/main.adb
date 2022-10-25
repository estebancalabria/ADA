with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is
begin
   --  declare
   --    --type Montos is array (Integer range <>) of Float;
   --    type Dinero is digits 2;
   --    --Empieza en la posicion 1:
   --    type Montos is array (Positive range <>) of Dinero;
   --    --Empieza en la posicion 0:
   --    type Array_Natural is array (Natural range <>) of Dinero;
   --     --Empieza en la posicion Integer'First
   --     type Array_Integer is array (Integer range <>) of Dinero;
   --     --Inicializaciones
   --    --Ventas : Montos(1..5);
   --     Ventas : Montos := (10.0, 2.3, 6.7);
   --     Ventas_Natural_Range : Array_Natural := (4.5,3.4);
   --     Ventas_Integer_Range : Array_Integer := (6.7, 2.3);
   --  begin
   --    --  Insert code here.
   --    --Ventas(0) := 2.3; --Porque da error?
   --     Put_Line("Primera Posicion (Positive range <>) " & Ventas'First'Image);
   --     Put_Line("Primera Posicion (Natural range <>) " & Ventas_Natural_Range'First'Image);
   --     Put_Line("Primera Posicion (Integer range <>) " & Ventas_Integer_Range'First'Image);
   --  end;

   declare
      --declarar un tipo de Arreglo de Float (abierto/unconstrained) (1..N)
      type Array_Float is Array(Positive range <>) of Float; --Oscar

      --declara una funcion que recibe un numero N y me devuelve un arreglo
      --de N numeros al azar
      function Arreglo_Numeros_Aleatorios(Num_N : in Integer) return Array_Float is
         G : Generator;
         Result : Array_Float(1..Num_N);
      begin
         for I in Result'Range loop
            Result(I) := Float((Random(G) * 10.0) + 1.0);
         end loop;
         return Result;
      end; -- Jorge

      --declarar una funcion que recibe un arreglo de ese tipo y me devuelve la
      --sumatoria con 'First y 'Last
      function Sumatoria(Entrada:in Array_Float) return Float is
         Retorno:Float := 0.0;
      begin
         for I in Entrada'Range loop
            Retorno := Retorno + Entrada(I);
         end loop;
         return Retorno;
      end; --Ilya

      --declarar una funcion que recibe un arreglo de ese tipo y me devuelve la
      --promedio
      function Promedio(Arreglo_Media : in Array_Float) return Float is
      begin
        return Sumatoria(Arreglo_Media)/Float(Arreglo_Media'Length);
      end; --Naqueeb

      --Un procedimiento que muestra el arreglo por pantalla
      procedure Mostrar (Arr : Array_Float) is
      begin
         for I in Arr'Range loop
            Put(Arr (I), Exp=>0);
            Put_Line("");
         end loop;
      end Mostrar; --Jonathan y Ruben

      Numeros : Array_Float := Arreglo_Numeros_Aleatorios(10);
   begin
      --  for I in reverse Numeros'Range loop
      --     Put(Numeros(I), Exp => 0);
      --     Put_Line("");
      --  end loop;
      Mostrar(Numeros);
      Put_Line("La Sumatoria es : ");
      Put(Sumatoria(Numeros),Exp =>0 );

      Put_Line("");
      Put_Line("El promedio es : ");
      Put(Promedio(Numeros), Exp =>0 );
   end;

end Main;
