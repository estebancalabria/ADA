with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is
   --N : Integer;
begin
   Put_Line("Bienevenido a la clase dos");
   --Ejemplo de For : Cuento hasta 10
   --  for I in 1..10 loop
   --     Put_Line(I'Image);
   --  end loop;

   --Jugando...
   --  N := 10;
   --  Put_Line(N'Image);
   --  Put_Line(Integer'Succ(N)'Image);
   --  Put_Line(Integer'Pred(N)'Image);
   --  If ((N mod 2) = 0) then
   --     Put_Line("Es Par");
   --  end if;

   --Que me liste los numeros pares entre 1 y 20
   --  for I in 1..20 loop
   --     if ((I mod 2) = 0) then
   --        Put_Line("Es Par" & Integer'Image(I));
   --     end if;
   --  end loop;

   --Jugando un poco con la consola
   --  Ada.Text_IO.Set_Line(4);
   --  Ada.Text_IO.Set_Col(10);
   --  Put("C");

   --La sumatoria de valores entre 1 y 15 y que la muestre
   --  declare
   --     Sumatoria : Integer := 0;
   --  begin
   --     for I in 1..15 loop
   --        Sumatoria := Sumatoria + I;
   --     end loop;
   --     Put_Line("La sumatoria entre 1 y 15 es" & Sumatoria'Image);
   --  end;

   --El promedio de 10 valores ingresados por el usuario
   declare
      use Ada.Integer_Text_IO;
      Sumatoria : Integer := 0;
      Valor_Ingresado : Integer;
      Promedio : Float;
      R :Real;
   begin
      --Promedio := Float(Sumatoria); --Deberia hacer un casteo
      Put_Line("Ingrese 10 valores");
      for I in 1..10 loop
         Get(Valor_Ingresado);
         Sumatoria := Sumatoria + Valor_Ingresado;
      end loop;
      --Promedio := Float (Sumatoria) / 10; --Asi no funciona
      Promedio := Float(Sumatoria) / 10.0;
      Put_Line("El Promedio es "  & Promedio'Image);
   end;
end Main;
