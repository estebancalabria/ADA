with Io; use Io;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Main is

begin
   declare
      Nombre : String := Get_Non_Empty_Line("Como te llamas?");
      Edad : Integer := Get_Integer("Que edad tienes?");
      Altura : Float := Get_Float("Cuanto mide?");
   begin
      Put_Line("Hola " & Nombre & " de " & To_String(Altura));
   end;

   null;
end Main;
