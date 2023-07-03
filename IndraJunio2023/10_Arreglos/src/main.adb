with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   procedure Countdown_Recursivo(N: Integer) is
   begin
      if (N=0) then
         Put_Line("Despegue...");
      else
         Put_Line(N'Image);
         Countdown_Recursivo(N-1);
      end if;
   end Countdown_Recursivo;

   function fib(N:Natural) return Integer is
   begin
      if (N<=1) then
         return N;
      else
         return fib(N-1) + fib(N-2);
      end if;
   end;

begin

   --  --Recursividad 1
   --  declare
   --     N : Integer := 10;
   --  begin
   --     Countdown_Recursivo(N);
   --  end;
   --
   --  --Programar la funcion recursiva fib()
   --  --fib(0) = 0;
   --  --fib(1), fib(2) => 1
   --  --fib(3) => 2
   --  --fib(4) => 3
   --  --fib(5) => 5
   --  --1,1,2,3,5,8,13,21,....
   --  Put_Line("El fiboancci de 10 es" & fib(10)'Image);

   declare
      type Array_Integer is array (Integer range <>) of Integer;  --Unconstrained arrays
      --Numeros : array (1..33) of Integer; --Array no inicializado que puede tener cualquier cosa
      --Numeros : array (1..33) of Integer := (1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3);
      --Muchos_Numeros : array (Positive) of Integer; --Esta es una declaracion valid pero no entra en memoria STACK_OVERFLOW
      --Numeros : array (1..33) of Integer := (others => 10);
      --Numeros : array (1..33) of Integer := (1=>1, 5=>15, 8=>3, others => 10);
      Numeros : Array_Integer(1..33) := (2|4|6|8|10 => 222, others => 33);
      --Menos_Numeros : Array_Integer(1..10) := Numeros;
      Menos_Numeros : Array_Integer(1..10) := Numeros(10..19); --Array Slices
   begin
      --Inicializo el array de numeros
      --Ada no inicializa los arreglos
      --  for N of Numeros loop
      --     Put_Line(N'Image);
      --  end loop;

      for N of Menos_Numeros loop
         Put_Line(N'Image);
      end loop;

      --<> <<<<< BOX NOTATION
   end;
end Main;
