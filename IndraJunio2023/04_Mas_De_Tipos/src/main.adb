with Ada.Text_IO;
with Ada.Strings; use Ada.Strings; --Esto no importa
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   package Console renames Ada.Text_IO;
begin
   Console.Put_Line("Bienvenidos a la clase 4");
   Console.Put_Line("Como te llamas?");
   declare
      --Nombre:String := Trim(Console.Get_Line,Side => Ada.Strings.Left);
      Nombre : Unbounded_String := To_Unbounded_String(Trim(Console.Get_Line,Side => Left));
      --NombreCorrecto : Boolean := False;
   begin
      --  if (Nombre'Length = 0) then
      --     Console.Put_Line("No Has Ingresado Nada...");
      --  else
      --     Console.Put_Line("Hola " & Nombre);
      --  end if;

      --Que problema tenemos??
      --NombreCorrecto := Nombre'Length > 0;
      --  NombreCorrecto := Length(Nombre)>0; --Los unbonded Strings no son array, no tienen el 'Length
      --  while (not NombreCorrecto) loop
      --     Console.Put_Line("No has Ingresado un nombre, vuelve a intentar");
      --     Nombre := To_Unbounded_String(Trim(Console.Get_Line,Side => Ada.Strings.Left));
      --     --NombreCorrecto := Nombre'Length > 0;
      --     NombreCorrecto := Length(Nombre)>0;
      --  end loop;

      --Version Dos Sin el Booleano
      while (not (Length(Nombre)>0)) loop
         Console.Put_Line("No has Ingresado un nombre, vuelve a intentar");
         Nombre := To_Unbounded_String(Trim(Console.Get_Line,Side => Ada.Strings.Left));
      end loop;

      Console.Put_Line("Hola " & To_String(Nombre));

      declare
         --tipos discretos
         type Altura_Centimetros is range 1..250;   --Esta es la formaa preferida para tipos discretos
         --type Altura_Centimetros is new Integer range 1..250;
         type Altura_Metros is new Float range 0.1..250.50; --Para los flotantes siempre se usa new
         type Metros is new Integer;  --Un tipo de dato nuevo sin definir el rango
         type Millas is new Integer;

         Distancia_Uno : Metros;
         Distancia_Dos : Millas;
      begin
         Distancia_Uno := 23;
         --Distancia_Dos := Distancia_Uno;  --Esta asignacion no es valida
         Distancia_Dos := Millas(Distancia_Uno);
         null;
      end;


   end;
end Main;
