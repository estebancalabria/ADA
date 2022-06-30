with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Numerics.Float_Random;

procedure Main is
   use Ada.Text_IO;
begin
   --Ejemplo 1 : ADA es un lenguaje MUY fuertemente tipado
   --            No existen conversiones explicitas
   --  declare
   --     type Distancia is new Float; --Estamos generando un alias de un tipo de datos
   --     type Area is new Float;
   --     type Nota is range 0..10;     --Estamos definiendo un alias de un Integer
   --     type EnteroLargo is range -(2**126)..(2**126);  --** es el exponente
   --
   --     Numero : Float;
   --     Base : Distancia;
   --     Altura : Distancia;
   --     AreaCuadrado : Area;
   --     NotaExamen : Nota;
   --     NumeroLargo : EnteroLargo;
   --  begin
   --     --Numero := 5;  --En cualquier lenguaje esto es valido, en ADA no (conversion implicita)
   --     Numero := 5.0;  --Para que la asignacion se valida, el float se escribe con 5.0
   --     Base := 7.0;    --Esto tambien es una asignacion valida
   --     Altura := 12.5; --Otra asignacion Valida
   --     --Base := Numero; --Base y Numero son de tipos distintos, esto es una asignacion incompatible
   --     Base := Distancia(Numero);  --Ahora la asignacion la fuerzo (Casteo)
   --     --AreaCuadrado := Base * Altura;  --Asignacion Invalida;
   --     AreaCuadrado := Area(Base * Altura);
   --
   --     --NotaExamen := 12;  --Lanza una excepcion en tiempo de ejecucion (Constraint Error)
   --     NotaExamen := 8;
   --     NumeroLargo := 2**35;  --2 elevado a las 25
   --     Put_Line("La variable NotaExamen tiene un " & NotaExamen'Image & " y en memoria ocupa "
   --              & NotaExamen'Size'Image & " bits");
   --     Put_Line("La variable Numero largo vale " & NumeroLargo'Image
   --              & " y en memoria ocupa " & NumeroLargo'Size'Image & " bits");
   --  end;

   --Ejemplo 2: Se le pregunta a los datos de una persona
   --           El nombre, el peso en Kilogramos y la altura en Metros
   --           Luego mostrar los datos por la pantalla
   --  declare
   --     use Ada.Strings.Unbounded;
   --
   --     type Kilogramos is new Float range 0.0..200.0;
   --     type Metros is Digits 2 range 0.0..2.3;
   --
   --     Nombre:Unbounded_String;
   --     Altura:Metros;
   --     Peso:Kilogramos;
   --  begin
   --     Put_Line("Ingrese Su Nombre");
   --     Nombre := To_Unbounded_String(Get_Line);
   --
   --     Put_Line("Altura en Metros (##.##)");
   --     Altura := Metros(Float'Value(Get_Line));
   --
   --     Put_Line("Peso en kg (##.##)");
   --     Peso := Kilogramos(Float'Value(Get_Line));
   --
   --     Put_Line("Nombre: "&To_String(Nombre)&", Altura: "&Altura'Image&", Peso: "&Peso'Image);
   --  end;

   -- Ejemplo 3
   -- Manejo de arreglos y ciclo for
   --  declare
   --     Arreglo : Array (1..5) of Integer;
   --  begin
   --     Arreglo := (1,3,5,6,8);
   --     for I in Arreglo'Range loop
   --        Put_Line(Arreglo(I)'Image);
   --     end loop;
   --  end;

   --Ejemplo 4
   --Cargar interactivamente un arreglo de 6 notas
   --Luego mostrarlas por pantalla
   --Finalmente mostrar la sumatoria de esas notas
   --  declare
   --     type Nota is range 1..10;
   --     type SumatoriaNotas is range 0..60;
   --     Arreglo : Array(1..6) of Nota;
   --     Sumatorio : SumatoriaNotas;
   --  begin
   --     Sumatorio := 0;
   --     for i in 1..6 loop
   --        Put_Line("Ingrese nota n " & i'Image);
   --        Arreglo(i) := Nota'Value(Get_Line);
   --        Sumatorio := Sumatorio + SumatoriaNotas(Arreglo(i));
   --        Put_Line("Nota n" & i'Image & ", valor: " & Arreglo(i)'Image);
   --     end loop;
   --     Put_Line("Sumatorio: " & Sumatorio'Image);
   --  end;

   --Ejemplo 5
   --Generar un numero aleatorio entre 0 y 100
   --  declare
   --     use Ada.Numerics.Float_Random;
   --     MaxValue : constant := 100.0;
   --     subtype ValorAlAzar is float range 0.0..MaxValue;
   --     Semilla : Generator;
   --     --NumeroAzar : Uniformly_Distributed; --Parecido a un float entre 0 y 1
   --     NumeroAzar : ValorAlAzar;
   --
   --  begin
   --     Reset(Semilla);
   --     NumeroAzar := ValorAlAzar(Random(Semilla)) * MaxValue;
   --     Put_Line("El valor al azar es : " & NumeroAzar'Image );
   --  end;

   --Ejercicio 6
   --Preguntar al usuario la cantidad de elementos que quiere (N) (al menos uno) (declare...declare)
   --Generar un arreglo de N valores flotantes entre 0..500 (primer for)
   --Luego volver a recorrer el arreglo (segundo for)
   --Calcular el promedio
   --Calcular el elemnto mayor  (TipoDeDato'Min)
   --Mostrarlos por pantalla
   -- Pedir número de elementos
   Put_Line("¿Cuantos elementos quiere?");

   declare
      -- Variables de números aleatorios
      use ADA.Numerics.Float_Random;
      Seed : Generator;
      MaxValue : constant := 500.0;
      subtype RandomValue is Float range 0.0..MaxValue;

      -- Variables usuario
      N : Integer := Integer'Value(Get_Line);
      -- Arreglo de N valores 0..N
      Arreglo : Array (1..N) of Float;
      Promedio : Float := 0.0;
      Mayor : Float := 0.0;

   begin
      -- Generar arreglo aleatorio
      for I in Arreglo'Range loop
         Reset(Seed);
         Arreglo(I) := RandomValue(Random(Seed)) * MaxValue;
         -- Mostrar arreglo
         Put_Line("Elemento Nº" & I'Image & ":" & Arreglo(I)'Image);
      end loop;

      for I in Arreglo'Range loop
         Promedio := Promedio + Arreglo(I);
         if (Arreglo(I) > Mayor) then
            Mayor := Arreglo(I);
         end if;
      end loop;
      Promedio := Promedio / Float(N);


      Put_Line("El promedio es" & Promedio'Image & ". Y el número mayor es" &
                 Mayor'Image & ".");
   end;

end Main;
