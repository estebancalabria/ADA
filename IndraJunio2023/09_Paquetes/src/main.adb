with Ada.Text_IO; use Ada.Text_IO;
with IO; use IO;

procedure Main is
   --type Primos is new Integer with Static_Predicate => Primos in 2|7|13|17;
   subtype Primos is Integer with Static_Predicate => Primos in 2|7|13|17;
   N : Integer := 17;
   --P : Primos := 21;

   --Pasenme la funcion prompt! Hace un Get_Line indefinidamente hasta que se ingresa un texto no vacio

begin
   if N in Positive then
      Put_Line("Es Positivo");
   end if;

   --Esto es un if (extructura de control) (Ejecuta instrucciones condicionalmente)
   if N in 2|7|13|17 then
      Put_Line("Es Primo");
   end if;


   --Expresion if (Devuelve un valor)
   declare
      Texto : String := (if N in Primos then "Primo" else "No Primo");
   begin
      Put_Line(Texto);
   end;

   --if N in Primos then
   --   Put_Line("Es Primo");
   --end if;

   declare
      Nombre : String := Prompt("Ingrese su nombre");
      Edad : Integer := Prompt("Ingrese su edad");
   begin
      Put_Line("Hola " & Nombre & " de" & Edad & " años");
   end;


end Main;
