with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   --  type Indice_Diez_Numeros is range 1..10;
   --  type Arreglo_Diez_Numeros is array (Indice_Diez_Numeros) of Integer;
   --  --type Diez_Numeros is array 1..10 of Integer;
   --  Diez_Numeros : Arreglo_Diez_Numeros;
   --  G : Generator;
begin
   --Cargo el arreglo de 10 numero
   --  for I In Indice_Diez_Numeros loop
   --     --Diez_Numeros(i) := Integer(I);
   --     Diez_Numeros(I) := Integer(Random(G) * Float(Integer'Last));
   --  end loop;
   --  Diez_Numeros := (1,2,3,4,5,6,7,8,9,10);
   --
   --  for I in Arreglo_Diez_Numeros'First..Arreglo_Diez_Numeros'Last loop
   --     Put_Line(Diez_Numeros(i)'Image);
   --  end loop;

   --  declare
   --     function "+"(Value: in String) return Unbounded_String renames To_Unbounded_String;
   --
   --     type Dia is (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo);
   --     --  Dia_En_Ingles : array (Dia) of Unbounded_String := (To_Unbounded_String("Monday"),
   --     --                                                      To_Unbounded_String("Tuesday"),
   --     --                                                      To_Unbounded_String("Wednesday"),
   --     --                                                      To_Unbounded_String("Thursday"),
   --     --                                                      To_Unbounded_String("Friday"),
   --     --                                                      To_Unbounded_String("Saturday"),
   --     --                                                      To_Unbounded_String("Sunday"));
   --     Dia_En_Ingles : array (Dia) of Unbounded_String := (+("Monday"),
   --                                                   +("Tuesday"),
   --                                                   +("Wednesday"),
   --                                                   +("Thursday"),
   --                                                   +("Friday"),
   --                                                   +("Saturday"),
   --    --  Un_Dia : Dia;                                               +("Sunday"));
   --  begin
   --     --  Un_Dia := Miercoles;
   --     --  Put_Line(To_String(Dia_En_Ingles(Un_Dia)));
   --     for Un_Dia in Dia_En_Ingles'Range loop
   --        Put_Line(To_String(Dia_En_Ingles(Un_Dia)));
   --     end loop;
   --  end;

   --  declare
   --     --Declarar un typo para un arreglo de 5 numeros
   --     --Declarar una funcion que devuelve el un arreglo del tipo anterior cargado
   --     --con numeros al azar
   --     type Indice_Cinco_Numeros is range 1.. 5;
   --     type Array_Cinco_Numeros is array (Indice_Cinco_Numeros) of Natural ;
   --
   --     function Array_Cinco_Numeros_Al_Azar return Array_Cinco_Numeros is
   --        G : Generator;
   --        Result : Array_Cinco_Numeros;
   --     begin
   --        for I in Indice_Cinco_Numeros loop
   --           Result(I) := Natural(Random(G) * Float(Natural'Last));
   --        end loop;
   --        return Result;
   --     end;

   --     Cinco_Al_Azar : Array_Cinco_Numeros := Array_Cinco_Numeros_Al_Azar;
   --  begin
   --     for I in Cinco_Al_Azar'Range loop
   --        Put_Line(Cinco_Al_Azar(I)'Image);
   --     end loop;
   --  end;

   --  declare
   --     --  --Que observan?
   --     --  type Array_Cinco_Numeros is array (1..5) of Positive;
   --     --  type Array_Siete_Numeros is array (1..7) of Positive;
   --     --  type Array_Diez_Numeros is array (1..10) of Positive;
   --     --Lo reemplazamos por...
   --     type Rango_Maximo is range 1..50;
   --     --type Array_Numeros is array (Integer range <>) of Positive;
   --     type Array_Numeros is array (Rango_Maximo range <>) of Positive;
   --     Diez_Numeros : Array_Numeros(1..10); --No me puedo paar de 50 ahora
   --  begin
   --     --Diez_Numeros := (1,2,3,4,5,6,7,8,9,10);
   --     Diez_Numeros := (1=>1, 5=>5, 7=>7, others=>100);
   --     --Diez_Numeros := (1=>1, 5=>5, 7=>7, others=><>);
   --     Put_Line("El Array tiene " & Diez_Numeros'Length'Image & " elentos");
   --     for I in Diez_Numeros'Range loop
   --        Put_Line(Diez_Numeros(I)'Image);
   --     end loop;
   --  end;

   declare
      --Declarar un tipo que sea un arreglo de numeros
      type Array_Numeros is array (Integer range <>) of Integer;
      --Declarar una funcion que reciba el un arreglo de numeros y devuelva el maximo
      function Maximo_En_Array (Array_N : Array_Numeros) return Integer is
         Maximo : Integer := 0;
      begin
         for I in Array_N'Range loop
            if Array_N(I) > Maximo  then
               Maximo:= Array_N(I);
            end if;
         end loop;
         return Maximo;
      end;

      Longitud_Ingresada : Integer;
   begin
      Put_Line("Cuantos numeros desea ingresar?");
      Longitud_Ingresada := Integer'Value(Get_Line);
      declare
         Numeros : Array_Numeros(1..Longitud_Ingresada);
      begin
         for I in Numeros'Range loop
            Put_Line("Ingrese el numero " & I'Image);
            Numeros(I) := Integer'Value(Get_Line);
         end loop;

         Put_Line("El maximo es " & Maximo_En_Array(Numeros)'Image);
      end;
   end;


end Main;
