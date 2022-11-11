with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Main is
   --types
   type Valor_Azar_Posible is new Integer range 1..100;
   --Constantes
   Default_Cantidad_Oportunidades : constant Integer := 5;
   Default_Valor_Maximo : constant Float := 100.0;

   G : Generator;
   --Numero_Al_Azar : Uniformly_Distributed;
   --Numero_Al_Azar : Float;
   Numero_Al_Azar : Integer;
   Numero_Introducido : Integer;
   Turno : Integer := 1;
   Es_Correcto : Boolean := False;
   --  No_Es_Correcto : Boolean := False;
begin
   --  if (Es_Correcto and not(No_Es_Correcto)) then
   --     Reset(G);
   --     for I in 1..10 loop
   --        Numero_Al_Azar := Integer((Random(G) * 100.0) + 1.0);
   --        --Put(Numero_Al_Azar, Exp => 0);
   --        --Put_Line("");
   --        Put_Line(Numero_Al_Azar'Image);
   --     end loop;
   --  end if;

   --La computadora determina un numero al azar
   --El usuario tiene N (por defecto 5) oportunidades
   --La computadora inforna al usuario si el numero ingresado es mayor o mehor al nuero secreto
   --Si el usuario adivina Gana, si no adivina dentro de las N oportunidades pierde
   Reset(G);
   Numero_Al_Azar := Integer((Random(G) * Default_Valor_Maximo) + 1.0);
   Put_Line("Se ha generado el número. "
            & "Tienes "
            & Default_Cantidad_Oportunidades'Image
            &" intentos.");
   loop
      Put_Line("Introduce un numero");
      Numero_Introducido := Integer'Value(Get_Line);
      if (Numero_Introducido > Numero_Al_Azar) then
            Put_Line("El numero que has introducido es mayor.");
      elsif (Numero_Introducido < Numero_Al_Azar) then
            Put_Line("El numero que has introducido es menor.");
      else
         Put_Line("Acertaste el número!");
         Es_Correcto := True;
         exit when Es_Correcto;
      end if;

      Turno := Turno + 1;
      exit when Turno > Default_Cantidad_Oportunidades;
   end loop;
   Put_Line("El número era " & Numero_Al_Azar'Image);
   Put_Line(if Es_Correcto then "Ganaste" else "Segui Participando");
end Main;
