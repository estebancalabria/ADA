with Ada.Text_IO; use Ada.Text_IO;
with Selva; use Selva;
with IO; use IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Main is
   --Leon : Animal;
   --Un_Animal : Animal;

   --Declaro un vector de animales
   --Diganme uds...
   type Array_Animales is array (Positive range <>) of Animal;

   Num_Animales : Integer;
begin
   --Leon := Create("Mufasa");

   --Elijo uno u otro
   --Un_Animal := new Clase_Leon;
   --Un_Animal := new Clase_Jirafa;

   --Ahora uso los constructores
   --Un_Animal := Create_Leon("Alex");
   --Un_Animal := Create_Jirafa("Mellman");

   --Put_Line("Hola soy " & Un_Animal.Get_Nombre);
   --Un_Animal.Hablar;

   --Pregunte al usuario cuantos animales quiere e inicalize un arreglo de animales
   --Agregar el bloque declare
   Put_Line("¿Cuántos animales quiere introducir?");
   Num_Animales := Get_Integer;
   declare
      Animales : Array_Animales(1..Num_Animales) := (others=>null);
      G : Generator;
      Azar : Uniformly_Distributed;
   begin
      Reset(G);

      for Index in Animales'Range loop
         --determinar un numero al azar
         --Put_Line("Introduzca el animal" & I);
         Azar := Random(G);

         --Lo hacen uds?:
         --Si el numero es <0.3 que agregue un Leon
         --Si es mayor a 0.7 que agregue una girafa
         --sino que agregue a su animal de preferencia
         if Azar< 0.3 then
            Animales(index):=Create_Leon("Mufasa");
         elsif Azar> 0.7 then
            Animales(index):=Create_Jirafa("Jiraf");
         else
            Animales(index):=Create_Aguila("EL Real");
         end if;
      end loop;

      Put_Line("Los ruidos de la selva...");
      --Recorrer el array de animales con un for of
      --hacer que cada animal hable
      for Criatura of Animales loop
         Criatura.Hablar;
      end loop;
   end;

end Main;
