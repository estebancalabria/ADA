with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

procedure Main is
   use Ada.Integer_Text_IO;
--   N : Integer;
   Edad : Integer := 0; --OJO: A Ada le va a gustar mas que especifique el rago de la Edad
   Nombre : Unbounded_String;
begin
   --Muestro un mensaje por pantalla
   --Ada.Text_IO.Put_Line("Hola Mundo Ada");
   --Ada.Text_IO.Put_Line("Bienvenidos aun nuevo lenguaje de programacion");

   --Una vez que agregamos el use no es necesario anteponer el nombre de la lib
   --  Put_Line("Hola Mundo Ada");
   --  Put_Line("Bienvenidos aun nuevo lenguaje de programacion");

   --Declarar variables
   --N := 90;
   --Put_Line(N'Image);
   --Ada.Integer_Text_IO.Put(N);
   --Put(N);
   --Put(N,3);
   --Put(Item => N, Width => 3);
   --Put(Width => 3, Item => N);
   --Put(N, Width => 3);
   --Put(N, Base => 2);
   --Put(N, Width => 0, Base=>2);

   --Obtener Valores de la E/S
   --Put_Line("Ingrese un numero");
   --Get(N);
   --Put(N);

   --  --Bienvenidos a las estructuras de control!
   --  Put_Line("Ingrese su edad");
   --  Get(Edad);
   --  Put(Edad);
   --  Put_Line("");
   --
   --  --  if Edad >= 18 then
   --  --     Put_Line("Es mayor de edad");
   --  --  end if;
   --
   --  --  if Edad >= 18 then
   --  --     Put_Line("Es Mayor");
   --  --  else
   --  --     Put_Line("Es Menor");
   --  --  end if;
   --
   --  if Edad<18 then
   --     Put_Line("Es un menor");
   --  elsif Edad in 18..70 then
   --     Put_Line("Es un adulto");
   --  else
   --     Put_Line("Es un jubilado");
   --  end if;

      --Bienvenidos a las estructuras de control!
   Put_Line("Ingrese su nombre");
   Get_Line(Nombre);
   Put_Line("Ingrese su edad");
   Get(Edad);

   Put_Line("Hola " & Nombre);


   if Edad<18 then
      Put_Line("Es un menor");
   elsif Edad in 18..70 then
      Put_Line("Es un adulto");
   else
      Put_Line("Es un jubilado");
   end if;

end Main;
