with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   type Edad is range 0..150;

   --  Nombre : Unbounded_String;
   --  Apellido : Unbounded_String;
   --  Edad_Persona : Edad;

   type Persona is record
      Nombre : Unbounded_String;
      Apellido : Unbounded_String;
      Edad_Persona : Edad;
   end record;

   Una_Persona : Persona;

   type D is new tagged Integer;
   subtype MS is D;
   subtype KMH is D;

   function TO_MS(A:MS) return MS is
   begin
      return A;
   end;

   function TO_MS(A:KMH) return MS is
   begin
      return A*1000;
   end;

   procedure Atomos(Distancia:D) is
     A : MS;
    begin
         A := TO_MS(Distancia)
        Put_Line(A'Image);
   end;

   Vel : KMH := 0;
begin
   Atomos(Vel);


   Put_Line("Cual es tu nombre?");
   --Nombre := To_Unbounded_String(Get_Line);
   Una_Persona.Nombre := To_Unbounded_String(Get_Line);

   Put_Line("Cual es tu apellido?");
   --Apellido := To_Unbounded_String(Get_Line);
   Una_Persona.Apellido := To_Unbounded_String(Get_Line);

   Put_Line("Cuantos años tenes?");
   --Edad_Persona := Edad(Integer'Value(Get_Line));
   Una_Persona.Edad_Persona := Edad(Integer'Value(Get_Line));

   --  Put_Line("Hola " & To_String(Nombre)
   --           & " " & To_String(Apellido)
   --           & " de " & Edad_Persona'Image
   --           & " años");
   Put_Line("Hola " & To_String(Una_Persona.Nombre)
            & " " & To_String(Una_Persona.Apellido)
            & " de " & Una_Persona.Edad_Persona'Image
            & " años");

end Main;
