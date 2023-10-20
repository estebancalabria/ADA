with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is
  --Para declarar un string tengo que saber cuanto ocupa
  --S : String;
  --Por ejemplo con un rango 1..20
  --S : String(1..20); --Declaracion Explicita
begin
   --Ejemplo 1 : Mi Primer Hola Mundo
   --Ada.Text_IO.Put_Line("Hola Mundo Ada");

   --Ejemplo 2 : Utilizamos Use para no repetir la libreria
   --Put_Line("Hola Mundo Ada con Use");

   --Ejemplo 3 : Entrada de datos
   --  Put_Line("Bienvenido a ADA");
   --  Put_Line("Cual es su nombre?");
   --  declare
   --     Nombre : String := Get_Line; --Declaracion String Implicita
   --  begin
   --     Put_Line("Hola " & Nombre);
   --  end;
   --La variable Nombre aca no existe mas

   --Ejemplo 4 : Strings explicitos
   --  Put_Line("Bienvenido a ADA");
   --  Put_Line("Cual es su nombre? (10 caracteres)");
   --  declare
   --     Nombre : String(1..10); --Declaracion explicita con un rango (1..10
   --  begin
   --     Nombre := Get_Line;  --Tengo que ingresar si o si 10 caracteres 0 va a dar un error
   --     Put_Line("Hola " & Nombre);
   --  end;
   -- --Este ejemplo lo vamos a revisitar en breve... pero por ahora

   --Ejemplo 5 : Variables Enteras, conversion de datos con atributo 'Image
   --  declare
   --     Numero_Uno : Integer;
   --     Numero_Dos : Integer := 3;  --Inicializo al declararla
   --     Suma : Integer;
   --  begin
   --
   --     Numero_Uno := 5;  --Asignacion con :=
   --     Suma := Numero_Uno + Numero_Dos;
   --
   --     --Put_Line("3 + 5 =");
   --     ----Put_Line(Suma); --Esta linea no funciona porque el procedimiento Put_Line recibe un String
   --     --Put_Line(Suma'Image); -- ' se usa para invocar una funcion especial que se llama atributo (conversion de datos)
   --                           -- El image lo convierte en un String y le pone un espacio antes
   --
   --     Put(Numero_Uno'Image &"+" & Numero_Dos'Image & " ="); --Muestro las variables en vez del valor "hardcodeado"
   --     Put_Line(Suma'Image); --Put_Line(Integer'Image(Suma)); --Tradicionalmente se hacia asi, pero se remplazo por la forma moderna Variable'Image
   --  end;
   --
   --  New_Line;  -- Si los metodos no reciben parametros no hay que poner ()
   --  Put_Line("Fin del Programa");

   --Ejercicio 6 : Libreria  Ada.Integer_Text_IO (No olvidarse del with arriba)
   --  declare
   --     use Ada.Integer_Text_IO;
   --
   --     Numero_Uno : Integer;
   --     Numero_Dos : Integer;
   --     Suma : Integer;
   --  begin
   --     Put_Line("Ingrese el Numero Uno");
   --     Ada.Integer_Text_IO.Get(Numero_Uno);  --Muestro que esta en esa libreria
   --     Put_Line("Ingrese el Numero Dos");
   --     Get(Numero_Dos);
   --     Suma := Numero_Uno + Numero_Dos;
   --
   --     --Ejercicio 6 - Opcion 1 - Mostrar Integer con el Put
   --     --  New_Line;
   --     --  Put(Numero_Uno); --Llama al de la libreria  Ada.Integer_Text_IO;
   --     --  Put("+");        --Llama al de la libreria  Ada.Text_IO;
   --     --  Put(Numero_Dos);
   --     --  Put("=");
   --     --  --Put_Line(Suma);  --No existe Put_Line en la  libreria  Ada.Integer_Text_IO;
   --     --  Put(Suma);  --No existe Put_Line en la  libreria  Ada.Integer_Text_IO;
   --     --  New_Line;
   --
   --     --Ejercicio 6 - Opcion 2 - Mostrar como ya vimos antes
   --     New_Line;
   --     Put_Line(Numero_Uno'Image & " +" & Numero_Dos'Image & " =" & Suma'Image);
   --  end;
   -- Que pasa si da un error?

   --Ejemplo 7 : Manejo de errores
   --  Put_Line("Ingrese Su nombre:");
   --  declare
   --     use Ada.Integer_Text_IO;
   --     Nombre : String := Get_Line;
   --     Edad : Integer;
   --  begin
   --     Put_Line("Ingrese su edad:");
   --     Get(Edad); --El Get es un metodo cuyo parametro es de entrada salida
   --                --Si ingresan letras tira un excepcion
   --                --Si no capturo esa excepcion el programa aborta
   --     Put_Line("Bienvenido " & Nombre & " de" & Edad'Image & " años");
   --
   --     --Es como un try..catch de java o python
   --  exception
   --        --when others => Put_Line("No se ha ingresado un numero para la edad"); --Cualquier tipo de excepcion
   --        when Data_Error => Put_Line("No se ha ingresado un numero para la edad"); --Una excepcion tipada
   --  end;

   --Ejemplo 8 : Conversion de String a Integer (No usa la libreria Ada.Integer_Text_IO)
   --  Put_Line("Ingrese su nombre:");
   --  declare
   --     Nombre : String := Get_Line;
   --  begin
   --     Put_Line("Ingrese su edad:");
   --
   --     --Necesito para este caso tener dos bloques declare anidados
   --     declare
   --        Edad_As_String : String := Get_Line;
   --        Edad : Integer := Integer'Value(Edad_As_String);  --El atributo value se usa sobre un tipo de dato
   --                                                          --Es lo puesto al image, se usa convertir de String a ese Tipo de dato
   --     begin
   --        Put_Line("Bienvenido " & Nombre & " de" & Edad'Image & " años");
   --
   --     --Un exception dentro del segundo bloque declare no me sirve en este caso
   --     --exception
   --     --    when others => Put_Line("Mal la edad"); --Esto no chequea lo de este bloque declare
   --     end;
   --
   --  --Aca si va bien, se chequea lo que esta dentro del begin end
   --  exception
   --     -- when others => Put_Line("Mal la edad"); --Esto no chequea lo de este bloque declare
   --     when Constraint_Error => Put_Line("Mal la edad"); --Esto no chequea lo de este bloque declare
   --  end;
   --

   --Ejemplo 9 - If
   Put_Line("Ingrese su Edad");
   declare
      use Ada.Integer_Text_IO;
      Edad :Integer;
   begin
      Get(Edad);
      Put_Line("Su edad es" & Edad'Image & " años");

      --Opcion 1 : If simple
      --  if (Edad>=18) then
      --     Put_Line("Usted es mayor de Edad");
      --  end if;

      --Opcion 2 : If Else
      --  if (Edad>=18) then                         --No hace falta parentesis
      --      Put_Line("Usted es mayor de Edad");
      --  else
      --     Put_Line("Usted es menor de Edad");
      --  end if;

      --Opcion 3 : con variables explicativas
      --  declare
      --     Es_Mayor_De_Edad : Boolean := (Edad>=18);
      --  begin
      --     if Es_Mayor_De_Edad then
      --       Put_Line("Usted es mayor de Edad");
      --    else
      --       Put_Line("Usted es menor de Edad");
      --    end if;
      --  end;

      -- Opcion 4 : con rangos
      --if (Edad in 1..17) then
      --   Put_Line("Usted es menor de Edad");
      --end if;

      --Opcion 5 : Expresiones if
      --           La expresiones if son como los operadores ternarios
      --           (Edad>=18) ? ", usted es mayor" : ", usted es menor"; en C, C++ o Java
      --Put_Line("Su edad es "& Edad'Image & (if (Edad>=18) then ", usted es mayor" else ", usted es menor"));

      --Opcion 6 : Elseif
      if (Edad<18) then
         Put_Line("Usted es Menor");
      elsif (Edad>18) then
         Put_Line("Usted es Mayor");
      else
         Put_Line("Justo la mayoria de edad");
      end if;

      if (Edad mod 2 = 0) then
         Put_Line("Su edad es Par");
      end if;

      Put("Su Edad es:");
      Put(Edad,0); --Con esta sobrecarga controlo los espacios antes del numero


   exception
       when others => Put_Line("Error Ingresando la Edad");
   end;


   New_Line;  -- Si los metodos no reciben parametros no hay que poner ()
   Put_Line("Fin del Programa");


end Main;


