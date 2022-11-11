with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Main is

begin
   --  declare
   --     Default_Mayoria_Edad :constant Integer := 18;
   --     Default_Edad_Persona_Mayor :constant Integer := 60;
   --     Edad:Integer := 19;
   --  begin
   --     --Default_Mayoria_Edad := 20; No me deja porque es una constante
   --     Put_Line("Ingrese su edad:");
   --     --Edad := Get_Line; No funciona, tipos incompatibles
   --     --Get(Edad);
   --     Edad := Integer'Value(Get_Line);
   --
   --     Put_Line("Su edad es :" & Edad'Image);
   --     --if Edad >= 18 then
   --     if (Edad >= Default_Edad_Persona_Mayor) then
   --        Put_Line("Usted un persona mayor de 60");
   --     elsif (Edad in Default_Mayoria_Edad..Default_Edad_Persona_Mayor) then
   --     -- elsif (Edad in 18..60) then
   --        Put_Line("Usted es mayor de edad");
   --     else
   --        Put_Line("Usted es Menor de edad");
   --     end if;
   --  end;
   --
   --Pedirle al usuario un numero y decir si es par o impar
   --  declare
   --     Numero : Integer;
   --  begin
   --     Put_Line("Ingrese un numero");
   --     Numero := Integer'Value(Get_Line);
   --     --  if((Numero mod 2) = 0) then
   --     --     Put_Line("El numero" & Numero'Image & " es par");
   --     --  else
   --     --     Put_Line("El numero" & Numero'Image & " es impar");
   --     --  end if;
   --     Put_Line( if((Numero mod 2) = 0) then "Es Par" else "Es Impar");
   --  end;

   --  declare
   --  begin
   --     --  Put_Line("Vamos a contar hasta 10");
   --     --  for I in 1..10 loop
   --     --     Put_Line(I'Image);
   --     --  end loop;
   --     Put_Line("Cuenta Regresiva");
   --     for I in reverse 1..10 loop
   --        delay 1.0;
   --        Put_Line(I'Image);
   --     end loop;
   --     Put_Line("Despegue...");
   --  end;

   --  --  Preguntar al usuario el nombre y cuantas N veces quiere que te salude
   --  --  Saludar al usuario N veces
   --  declare
   --     Numero : Integer;
   --  begin
   --     Put_Line("Cuantas veces quieres que te salude?");
   --     --Get(Numero); --Es tramposo
   --     Numero := Integer'Value(Get_Line); --Prefiero esta conversion
   --     for I in 1..Numero loop
   --         Put_Line("Hola guapo");
   --     end loop;
   --
   --     --O bien
   --     --Put_Line(Numero * "Hola Guapo ");
   --  end;

   --  declare
   --     N :Integer;
   --  begin
   --     Put_Line("Ingrese un numero");
   --     Get(N);
   --     while N>0 loop
   --        N := (N/2);
   --        Put_Line("Divido 2 es " & N'Image);
   --     end loop;
   --  end;

   --Preguntar al usuario un numero
   --Hasta que el usuario ingrese un 0
   --con un while (Lectura adelantada)
   --Mostrar la sumatoria de numeros
   --  declare
   --     Numero:Integer;
   --     Total:Integer:=0;
   --  begin
   --     Put_Line("Di un numero con el que empezar:");
   --     Get(Numero);  --Lectura adelantada
   --     while (Numero /= 0) loop
   --        Total:=Total+Numero;
   --        Put_Line("Di un numero para sumar. 0 para terminar.");
   --        Get(Numero);
   --     end loop;
   --     Put_Line("La suma total es: " & Total'Image);
   --  end;

   --  declare
   --     Numero:Integer;
   --     Total:Integer:=0;
   --     Default_Tope_Total : constant Integer := 100;
   --  begin
   --     loop
   --        Put_Line("Di un numero para sumar. (0 para terminar. Max 100)");
   --        Get(Numero);
   --        exit when (Numero=0);
   --        Total:=Total+Numero;
   --        exit when (Total>=Default_Tope_Total); --Puede tener dos exit
   --     end loop;
   --     Put_Line("La suma total es: " & Total'Image);
   --  end;

   --Preguntar al usuario el nombre y saludarlo
   --Hasta que el usuario ingrese un string vacio
   --con un loop
   --  declare
   --     --Nombre:String:="";
   --     -- Nombre : String(1..0); --Es lo mismo que hacer
   --     --N : Integer;
   --  begin
   --     --Get(N); --OJO: El get Interfiere con el proximo Get_Line;
   --     loop
   --        Put_Line("Di tu nombre para saludarte, vacio para terminar");
   --        declare
   --           Nombre: String := Get_Line;  --Esto no funciona si el string ya tiene una longitud distinta
   --        begin
   --           --exit when (Nombre'Length=0);
   --           exit when (Nombre="");
   --           Put_Line("Hola " & Nombre);
   --        end;
   --     end loop;
   --  end;

   --Ejemplo del Case
   declare
      Nota : Integer;
   begin
      Put_Line("Ingrese su nota del examen");
      Nota := Integer'Value(Get_Line);
      case Nota is
         when 0 => Put_Line("Examen copia. Hable con el rector");
         when 1..4 => Put_Line("Reprobado");
         when 5 => Put_Line("Aprobado con lo justo");
         when 6 | 7 => Put_Line ("Aprobado");
         when 8..9 => Put_Line("Muy bien");
         when 10 => Put_Line("Excelente");
         when others => Put_Line("Fuera De Rango");
      end case;
   end;


end Main;
