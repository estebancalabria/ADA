with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is
--   type Hasta_Cinco is new Integer range 1..5;
--   F : Float := 2.5;
--   N5 : Hasta_Cinco;
--   A : array (1..5) of Integer;

   --  type Fixed_Float is delta 0.001 digits 6;  -- --Seis digitos en total! 3 despues de la coma y 3 antes
   --  type Other_Fixed_Float is digits 5;  --0.000005  --Aseguraame que no pierdo precision para trabajar con 5 digitos
   --
   --  type D3 is digits 3;

   --  Seed : Generator;
   --  Numero_Al_Azar : Integer;
   --  Valor_Al_Azar : Uniformly_Distributed;
   --  D1 : Fixed_Float := 32.0;
   --  D2  : Other_Fixed_Float := 32.0;
   --
   --  A : D3 := 13.9;
   --  B : D3 := 0.001;
   --  C : D3 := A + B;
   --
   --  F: Float := 43.4;
begin
--     Ada.Float_Text_IO.Put(F, Exp=>0, Aft => 7);
--     New_Line;
--  --   Put_Line(Integer(F)'Image);
--  --   Put_Line(Integer(Float'Rounding(F))'Image);
--  --   Put_Line(Integer(Float'Truncation(F))'Image);   --  Insert code here.
--     Put_Line(D1'Image);
--     Put_Line(D2'Image);
--
--     --D1 := Fixed_Float'Value(Get_Line); --<<< Forma para leer cualqueir tipo y convertirlo
--
--     --Reset(Seed);
--     --for I in 1..50 loop
--     --   Valor_Al_Azar := Random(Seed);
--     --   Numero_Al_Azar :=Integer(Valor_Al_Azar * 20.0); --Numero entre 0 y 20
--     --   Put_Line(Valor_Al_Azar'Image);
--     --   Put_Line(Numero_Al_Azar'Image);
--     --end loop;

   --Determinar un numero al azar entre 1 y MAX (Definido como constante)
   --Que el usuario ingrese un numero
   --Decirle si el numero ingreso es mayor, menor o igual al numero al azar
   declare
      MAX : constant := 20.0;
      Seed : Generator;
      Numero_Al_Azar : Integer;
      Valor_Al_Azar : Uniformly_Distributed;
      Valor : Integer;
   begin
      Reset(Seed);
      Valor_Al_Azar := Random(Seed);
      --Numero_Al_Azar := Integer(Valor_Al_Azar * MAX); --  0..Max
      --Numero_Al_Azar := Integer(Valor_Al_Azar * (MAX) + 1; -- 1..Max+1
      Numero_Al_Azar := Integer(Valor_Al_Azar * (MAX - 1.0) + 1.0) ; -- 1..Max
      Put_Line("Introduzca un numero entre 1 y " & Max'Image);
      Valor := Integer'Value(Get_Line);
      if Numero_Al_Azar>Valor then
         Put_Line("El valor introducido es menor ");
      elsif Numero_Al_Azar<Valor then
         Put_Line("El valor introducido es mayor ");
      else
         Put_Line("El valor es igual");
      end if;
      Put_Line(Numero_Al_Azar'Image);
   end;
end Main;
