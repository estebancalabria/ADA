with Ada.Text_IO; use Ada.Text_IO;
with IO; use IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is

begin
   --Declarando Arreglos
   --  declare
   --     type Arreglo_Numeros is array (1..3) of Positive; --Declarando un array en forma explicita
   --
   --     Numeros : Arreglo_Numeros;
   --     --Mas_Numeros : Arreglo_Numeros := (10,20,30,50); -- Esta declaracion lanza una excepcion
   --                                                     -- Estoy sobrepasando la capacidad del arreglo
   --     Mas_Numeros : Arreglo_Numeros := (10,20,30);
   --     Todavia_Mas_Numeros : Arreglo_Numeros := (2 => 100, others => 1); --Inicializando con aggregate
   --  begin
   --     Numeros(1) := 3;
   --     Numeros(2) := 5;
   --     Numeros(3) := 19;
   --
   --     for I in Numeros'Range loop
   --        Put_Line("Numeros(" & I'Image & ") = " & Numeros(I)'Image );
   --     end loop;
   --
   --     Put("Mas_Numeros = [");
   --     for N of Mas_Numeros loop
   --        Put(N'Image);
   --        Put(" ");
   --     end loop;
   --     Put("]");
   --     Put_Line(" ");
   --
   --     Put("Todavia_Mas_Numeros = (");
   --     for I in Todavia_Mas_Numeros'First..Todavia_Mas_Numeros'Last loop
   --        Put(Todavia_Mas_Numeros(I)'Image);
   --        Put(if (I /= Todavia_Mas_Numeros'Last) then "," else ""); --Expresion if
   --     end loop;
   --     Put(")");
   --  end;

   --Declarar un tipo Nota que permita almacenar las notas de los examenes
   --Luego.. preguntar al alumno cuantos examenes rindio
   --Declarar un arreglo para almacenar sus examenes (declare dentro de otro)
   --Preguntarle uno a uno la nota de los mismos  (y almacenarlo (casteo))
   --  declare
   --     type Nota is new Integer range 1..10;
   --     type Examenes is Array(1..Get_Integer("¿Cuántos examenes has tenido?")) of Nota;
   --     Lista_Examenes : Examenes;
   --  begin
   --     for C in Lista_Examenes'Range loop
   --        Lista_Examenes(C) := Nota(Get_Integer_Between(
   --                                  Integer(Nota'First),
   --                                  Integer(Nota'Last),
   --                                  "¿Qué nota sacaste en el examen" & C'Image & "?"));
   --     end loop;
   --
   --     Put_line("Has sacado las siguientes notas:");
   --     for C in Lista_Examenes'range loop
   --        Put_line("Examen"& C'image & ":" & Lista_Examenes(C)'Image);
   --     end loop;
   --  end;

   --  declare
   --     type Dias_Semana is (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo);
   --     subtype Fin_De_Semana is Dias_Semana range Sabado..Domingo;
   --
   --     function "+"(Input: in String) return Unbounded_String is
   --     begin
   --        return To_Unbounded_String(Input);
   --     end;
   --
   --     function C(Input: in String) return Unbounded_String renames To_Unbounded_String;
   --
   --
   --     --Omiti la declaracion del type
   --     Dias_En_Ingles : array (Dias_Semana) of Unbounded_String
   --       --  := (To_Unbounded_String("Monday"),
   --       --      To_Unbounded_String("Tuesday"),
   --       --      To_Unbounded_String("Wednesday"),
   --       --      To_Unbounded_String("Thursday"),
   --       --      To_Unbounded_String("Friday"),
   --       --      To_Unbounded_String("Saturday"),
   --       --      To_Unbounded_String("Sunday") );
   --       --Sobrecargando operadores
   --       -- := (+"Monday",+"Tuesday",+"Wednesday",+"Thursday",+"Friday",+"Saturday",+"Sunday" );
   --       --Con Renames
   --       := (C("Monday"),C("Tuesday"),C("Wednesday"),C("Thursday"),C("Friday"),C("Saturday"),C("Sunday") );
   --  begin
   --     Put_Line("Ingrese un dia de la semana");
   --     for Dia in Dias_Semana loop
   --        Put_Line(Dia'Image);
   --     end loop;
   --
   --     declare
   --        Dia : Dias_Semana := Dias_Semana'Value(Get_Line);
   --     begin
   --        Put_Line(Dia'Image & " en Ingles es " & To_String(Dias_En_Ingles(Dia)));
   --     end;
   --  end;

   --Unconstraint arrays o vectores sin restriccion
   --  declare
   --     type Nota is range 1..10;
   --     --type Lista_Notas is array(Positive range <>) of Nota;
   --     type Lista_Notas is array(Positive range <>) of Nota with Default_Component_Value => 10;
   --
   --     Notas : Lista_Notas(1..3);             -- Explicita
   --     --Notas : Lista_Notas := (4,5,6,2,4,5);  -- Implicita
   --  begin
   --     for Nota of Notas loop
   --        Put_Line(Nota'Image);
   --     end loop;
   --  end;

   --Rehacer el ejercicio de las notas pero con unconstrained arrays
   declare
      type Nota is new Integer range 1..10 with Default_Value => 5;
      type Nota_Promedio is new Float range 1.0..10.0;
      type Lista_Examenes is array(Positive range <>) of Nota with Default_Component_Value => 10;

      procedure Cargar_Notas(Lista : out Lista_Examenes) is
      begin
         for I in Lista'Range loop
            Lista(I) := Nota(Get_Integer_Between(Integer(Nota'First),
                             Integer(Nota'Last),
                            "Introduce una nota para el examen"));
         end loop;

      end Cargar_Notas;

      procedure Mostrar_Notas(Lista : in Lista_Examenes) is
      begin
         Put_line("Has sacado las siguientes notas:");
         for Examen of Lista loop
            Put_line(Examen'Image);
         end loop;
      end Mostrar_Notas;

      --Crear un subprograma que devuelva la nota mas alta
      function Nota_Mas_Alta (List : in Lista_Examenes) return Nota is
         Max : Nota := Nota'First;
      begin
         for Examen of List loop
            if (max<Examen) then
               Max := Examen;
            end if;
         end loop;
         return Max;
      end Nota_Mas_Alta;

      --Crear una funcion que devuelva el promedio
      function Promedio(Lista : in Lista_Examenes) return Nota_Promedio is
         type Sumatoria_Notas is new float range 0.0..(10.0*Float(Lista'Length));
         Suma : Sumatoria_Notas := 0.0;
      begin
         Put_Line("Tu promedio de notas es: ");
         for C of Lista loop
            Suma := Sumatoria_Notas(C) + Suma;
         end loop;
         return Nota_Promedio(Suma/Sumatoria_Notas((Lista'length)));
      end Promedio;




      Examenes : Lista_Examenes(1..Get_Integer("¿Cuantos exámenes has hecho?"));

   begin
      Cargar_Notas(Examenes);
      Mostrar_Notas(Examenes);
      Put_Line("Tu Nota Mas Alta es un" & Nota_Mas_Alta(Examenes)'Image);
   end;
end Main;
