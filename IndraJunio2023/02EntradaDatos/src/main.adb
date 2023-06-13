with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   --Edad : Integer;
   --Texto : String; No me permite declarar Strings sin especificar la longitud
   --Apellido : String(1..3);
begin
   Put_Line("Bienvenidos a la clase dos de ADA");
   Put_Line("Cual es su nombre?");

   declare
      Nombre : String := Get_Line; --La longitud del String va a depender de lo que el usuario Ingrese
   begin
      Put_Line("Hola " & Nombre);
   end;

   --Un ejemplo del manejo de Strings con restricciones (constrained)
   --  Put_Line("Cual es su apellido?");
   --  Apellido := Get_Line; --Solo va a funcionar si el apellido tiene 10 caracteres
   -- Put_Line(Nombre); La variable nombre ya no existe
   New_Line;

   Preguntar_Edad: declare
      Edad:Integer;
   begin
      Put_Line("Ingrese su edad");
      Get(Edad);  --Si aca se produce una excepcion no capturada el programa aborta
      --  Put("Usted tiene ");
      --  Put(Edad);
      --  Put(" años");
      --  New_Line;
      Put_Line("Tienes" & Edad'Image & " años");
   exception
         --when Data_Error => Put_Line("No ha ingresado un numero");
      when others => Put_Line("Se Ha producido un error");
   end Preguntar_Edad;

   Put_Line("Fin Del Programa");
end Main;

