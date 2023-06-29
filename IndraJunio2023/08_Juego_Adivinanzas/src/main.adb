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
   --  declare
   --     MAX : constant := 20.0;
   --     Seed : Generator;
   --     Numero_Al_Azar : Integer;
   --     Valor_Al_Azar : Uniformly_Distributed;
   --     Valor : Integer;
   --  begin
   --     Reset(Seed);
   --     Valor_Al_Azar := Random(Seed);
   --     --Numero_Al_Azar := Integer(Valor_Al_Azar * MAX); --  0..Max
   --     --Numero_Al_Azar := Integer(Valor_Al_Azar * (MAX) + 1; -- 1..Max+1
   --     Numero_Al_Azar := Integer(Valor_Al_Azar * (MAX - 1.0) + 1.0) ; -- 1..Max
   --     Put_Line("Introduzca un numero entre 1 y " & Max'Image);
   --     Valor := Integer'Value(Get_Line); --Mejor con prompt
   --     if Numero_Al_Azar>Valor then
   --        Put_Line("El valor introducido es menor ");
   --     elsif Numero_Al_Azar<Valor then
   --        Put_Line("El valor introducido es mayor ");
   --     else
   --        Put_Line("El valor es igual");
   --     end if;
   --     Put_Line(Numero_Al_Azar'Image);
   --  end;

   --  declare
   --     --Programar el juego de adivinar el numero
   --     Max_Oportunidades : constant := 5;
   --     Max_Valor : constant := 100;
   --
   --     subtype Entre_1_Y_Max is Integer range 1..Max_Valor;
   --
   --     Seed : Generator;
   --     Numero_Al_Azar : Entre_1_Y_Max;
   --     Numero_Adivinado : Entre_1_Y_Max;
   --     Oportunidad_Actual : Integer := 1;
   --     Victoria : Boolean := False;
   --  begin
   --     Reset(Seed);
   --                                                          --Max_Valor - 1
   --     Numero_Al_Azar := Entre_1_Y_Max(Random(Seed) * Float(Max_Valor-1) + 1.0);
   --
   --     Put_Line("Adivina el numero secreto entre"
   --              & Entre_1_Y_Max'First'Image
   --              &" Y "
   --              & Entre_1_Y_Max'Last'Image);
   --     loop
   --        begin
   --           Put_Line("Oportunidad" & Oportunidad_Actual'Image & " de " & Max_Oportunidades'Image);
   --           Oportunidad_Actual := Oportunidad_Actual+1;
   --
   --           Numero_Adivinado := Entre_1_Y_Max'Value(Get_Line);
   --           Victoria := Numero_Adivinado = Numero_Al_Azar;   --Asigno una expresion a una variable booleana
   --           exit when Victoria;  --es lo mismo exit when Victoria=True;
   --
   --           Put_Line("El numero ingresado es " &
   --                    (if (Numero_Adivinado>Numero_Al_Azar) then "mayor" else "menor") &
   --                     " al mumero secreto");
   --
   --           exit when (Oportunidad_Actual>Max_Oportunidades);
   --        exception
   --           when others => Put_Line("Ingresaste mal, perdiste una oportunidad");
   --        end;
   --     end loop;
   --
   --     Put_Line(if Victoria then "Ganaste" else ("Perdiste, el numero era" & Numero_Al_Azar'Image));
   --  end;
   --

   --  for I in Positive loop
   --     Put_Line(I'Image);
   --  end loop;

   declare
      type Dias_Semana is (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo);

      subtype Dias_Laborales is Dias_Semana range Lunes..Viernes;
      type Dias_To_String is array (Dias_Semana) of String(1..3);

      In_English:Dias_To_String := ("Mon","Tue","Wed","Thu","Fri","Sat","Sun");
   begin
      --  for Dia in Dias_Semana loop
      --     Put_Line(Dia'Image & " - " & In_English(Dia));
      --  end loop;
      --
      --  for Dia of In_English loop --Un for sobre el tipo Array
      --     Put_Line(Dia);
      --  end loop;

      for Dia in Dias_Semana loop
         --Horrible 1:
         --  if Dia = Lunes then
         --        Put_Line(Dia'Image & " es dia de Semana");
         --  end if;
         --  if Dia = Martes then
         --        Put_Line(Dia'Image & " es dia de Semana");
         --  end if;
         --  if Dia = Miercoles then
         --        Put_Line(Dia'Image & " es dia de Semana");
         --  end if;
         --  if Dia = Jueves then
         --        Put_Line(Dia'Image & " es dia de Semana");
         --  end if;
         --  if Dia = Viernes then
         --        Put_Line(Dia'Image & " es dia de Semana");
         --  end if;
         --  if Dia = Sabado then
         --        Put_Line(Dia'Image & " es fin de Semana");
         --  end if;
         --  if Dia = Domingo then
         --        Put_Line(Dia'Image & " es fin de Semana");
         --  end if;

         --Menos horrible pero sigue feo
         --  case Dia is
         --     when Lunes => Put_Line(Dia'Image & " es dia de Semana");
         --     when Martes => Put_Line(Dia'Image & " es dia de Semana");
         --     when Miercoles => Put_Line(Dia'Image & " es dia de Semana");
         --     when Jueves => Put_Line(Dia'Image & " es dia de Semana");
         --     when Viernes => Put_Line(Dia'Image & " es dia de Semana");
         --     when others => Put_Line(Dia'Image & " es fin de Semana");
         --  end case;

         --
         --  if Dia in Lunes..Viernes then
         --     Put_Line(Dia'Image & " es dia de Semana");
         --  else
         --    Put_Line(Dia'Image & " es fin de Semana");
         --  end if;

         --  Put_Line(Dia'Image & (if Dia in Lunes..Viernes then " es dia de Semana" else " es fin de Semana"));
         --
         --  if Dia in Dias_Laborales then
         --     Put_Line(Dia'Image & " es dia de Semana");
         --  else
         --    Put_Line(Dia'Image & " es fin de Semana");
         --  end if;
         --
         --  Put_Line(Dia'Image & (if Dia in Dias_Laborales then " es dia de Semana" else " es fin de Semana"));

         --Choice Operator
         if Dia in Martes|Viernes|Domingo then
            Put_Line(Dia'Image & " es un buen dia");
         else
            Put_Line(Dia'Image & " es un dia que no me gusta");
         end if;

      end loop;
   end;


end Main;
