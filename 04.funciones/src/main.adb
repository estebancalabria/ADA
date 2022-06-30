with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Strings;
with Consola;

procedure Main is
   use Ada.Text_IO;
   use Ada.Strings.Unbounded;
   use Ada.Strings.Fixed;
   use Ada.Strings;

   type Genero is (Masculino, Femenino, NoBinario);
   type Persona is record
      Nombre: Unbounded_String;
      Edad : Integer;
      ElGenero : Genero;
   end record;

   --Nombre : Unbounded_String;
   --Edad : Integer;
   UnaPersona : Persona;
begin
   --Ejericio 1: Preguntar el nombre de una persona
   --            Si ingresan vacio volver a preguntar
   --            Con un loop en vez de un while
   --Put_line("Ingrese su nombre");
   --Nombre := To_Unbounded_String (Trim(Get_Line,Both));
   --while (Length(Nombre)) = 0 loop
   --       Put_Line("Ingreso Vacio. Vuelva a Ingresar");
   --        Nombre := To_Unbounded_String (Trim(Get_Line,Both));
   --end loop;
   --Put_Line(To_String(Nombre));
   --Put_line("Ingrese su nombre");
   --loop
   --   Nombre := To_Unbounded_String (Trim(Ada.Text_IO.Get_Line,Both));
   --   exit when Length(Nombre) > 0;
   --   Ada.Text_IO.Put_Line("Vuelva a ingresarlo...");
   --end loop;
   UnaPersona.Nombre := Consola.Get_NotEmpty_String("Ingrese Su nombre");
      --Ejercicio 2 : Desarrollar la funcion Get_integer
   UnaPersona.Edad := Consola.Get_NotEmpty_Integer("Ingrese su edad");
   UnaPersona.ElGenero := Masculino;

   Put_Line(To_String(UnaPersona.Nombre));
   Put_Line(UnaPersona.Edad'Image);

end Main;


