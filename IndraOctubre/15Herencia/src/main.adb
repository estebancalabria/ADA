with Ada.Text_IO; use Ada.Text_IO;
with Selva; use Selva;

procedure Main is
   --Leon : Animal;
   Un_Animal : Animal;
begin
   --Leon := Create("Mufasa");

   --Elijo uno u otro
   --Un_Animal := new Clase_Leon;
   --Un_Animal := new Clase_Jirafa;

   --Ahora uso los constructores
   Un_Animal := Create_Leon("Alex");
   --Un_Animal := Create_Jirafa("Mellman");

   Put_Line("Hola soy " & Un_Animal.Get_Nombre);
   Un_Animal.Hablar;
end Main;
