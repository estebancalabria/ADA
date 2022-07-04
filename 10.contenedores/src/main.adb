with Ada.Containers.Vectors;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.strings.Fixed;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with UtilidadesTipos; use UtilidadesTipos;
with BarajaSpanish; use BarajaSpanish;
with Ada.Containers.Ordered_Sets;

procedure Main is
   --  package VectorNumerico is new Ada.Containers.Vectors(Index_Type   => Natural,   --Remplazo de use
   --                                                       Element_Type => Integer);
   --  use VectorNumerico;
   --  Numeros : Vector := 1 & 2;
begin
   --  Numeros.Append(1);
   --  Numeros.Append(2);
   --  Numeros.Append(3);
   --  Put_Line("La Longitud del vector es " & Numeros.Length'Image);
   --  Numeros.Append(4);
   --  Numeros.Append(5);
   --  Numeros.Append(6);
   --  Put_Line("La nueva Longitud del vector es " & Numeros.Length'Image);
   --
   --  --Iterando Vector
   --  for Num of Numeros loop
   --     Put(Num'Image & " ");
   --  end loop;
   --  Put_Line("");
   --
   --  --Acceder a un elemento
   --  Put_Line("La primer posicio del vector contiene : " & Numeros.First_Element'Image);
   --  Put_Line("La tercer Posicion del Vector contiene :" & Integer'Image(Numeros(3)));
   --  Put_Line("La utlima posicio del vector contiene : " & Numeros.Last_Element'Image);
   --
   --  --Iterando por indices
   --  for Indice in Numeros.Iterate loop
   --     Put_Line("Numeros(" & To_Index(Indice)'Image & ") = " & Integer'Image(Numeros(Indice)));
   --  end loop;
   --
   --  declare
   --     Sumatoria : Integer;
   --     Promedio : Float;
   --  begin
   --     for Num of Numeros loop
   --        Sumatoria := Sumatoria + Integer(Num);
   --     end loop;
   --     Promedio := Float(Sumatoria) / Float(Numeros.Length);
   --  end;

   --Pedir al usuario las notas de los examenes 1..10
   --Cuando Ingrese un valor fuera de rango o no numerico (pueden hacer la funcion IS_Nota...)
   --Mostrar las notas ingresadas y el promedio
   --  declare
   --     type Nota is range 0..10;
   --
   --     package VectorNotas is new Ada.Containers.Vectors(Index_Type   => Natural,   --Remplazo de use
   --                                                       Element_Type => Nota);
   --
   --
   --     ListaNotas : VectorNotas.Vector;
   --     --NotaValue : Nota;
   --     Salida : boolean := false;
   --     Promedio : Float := 0.0;
   --
   --     --  function Is_EnteroEntre0y10(Valor : String) return Boolean is
   --     --     Num : Nota;
   --     --  begin
   --     --     Num := Nota'Value(Valor); --Esto me tira una excepcion si esta fuera de rango o si son letras
   --     --     return True;
   --     --  exception
   --     --     when others => return False;
   --     --  end Is_EnteroEntre0y10;
   --     UnaNota : Nota;
   --     function Is_EnteroEntre0y10 is new IS_Type(T=> Nota, ConvertedValue => UnaNota);
   --  begin
   --
   --     loop
   --        Put_Line("Ingrese nota");
   --        declare
   --           Entrada : String := Trim(Get_Line, Both);
   --        begin
   --           if (Is_EnteroEntre0y10(Entrada)) then
   --              ListaNotas.Append(Nota'Value(Entrada));
   --           else
   --              Put_Line("Dato no está entre 0 y 10. Fin meter notas");
   --              salida := true;
   --           end if;
   --        end;
   --        exit when salida = true;
   --     end loop;
   --
   --
   --     for Num of ListaNotas loop
   --        Put_Line("Nota" & Num'Image);
   --        Promedio := float(Promedio) + float(Num);
   --     end loop;
   --     Promedio := Promedio / float(ListaNotas.Length);
   --     Put_Line("Promedio: ");
   --     Put(Promedio,1,2,0);
   --  end;
   declare
      --  package MazoDeCartas is new Ada.Containers.Vectors(Index_Type   => Count_Cartas,
      --                                                     Element_Type => PCarta);
      --  Mazo : MazoDeCartas.Vector;
      package MazoDeCartas is new Ada.Containers.Ordered_Sets(Element_Type => PCarta);
      Mazo : MazoDeCartas.Set;
      UnaCarta : PCarta;
   begin
      for Num in Numero_Carta loop
         For Palo in Palo_Carta loop
            UnaCarta := new Carta;
            UnaCarta.Numero := Num;
            UnaCarta.Palo := Palo;
            Mazo.Insert(UnaCarta);
         end loop;
      end loop;

      For C of Mazo loop
         C.Mostrar;
      end loop;

   end;
end Main;
