with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Unchecked_Conversion;
with Interfaces;        use Interfaces;

procedure Main is
   -- Convertimos Float a Unsigned_32
   function To_Bits is new Ada.Unchecked_Conversion
     (Source => Float, Target => Unsigned_32);

   -- Instanciamos un paquete de E/S para Unsigned_32
   package U32_IO is new Ada.Text_IO.Modular_IO (Unsigned_32);
   use U32_IO;

   A : constant Float := Float'Value ("0.2");
   B : constant Float := Float'Value ("0.3");
   C : constant Float := A + B;
   D : constant Float := 0.5;

   procedure Imprecision is
      X : Float := 0.0;
      I : Integer;
   begin
      for I in 1 .. 10 loop
         X := X + 0.1;
      end loop;

      Put ("Suma de 0.1 diez veces = ");
      Put (X, Fore => 1, Aft => 10, Exp => 0);
      New_Line;

      Put ("Valor esperado         = ");
      Put (1.0, Fore => 1, Aft => 10, Exp => 0);
      New_Line;

      if X = 1.0 then
         Put_Line ("¡Son iguales!");
      else
         Put_Line ("¡NO son iguales!");
      end if;
   end Imprecision;

   procedure Decimal_Exacto is
      type Decimal is delta 0.01 digits 10;

      X : Decimal := 0.0;
      D : Decimal := 1.0;
      I : Integer;
   begin
      for I in 1 .. 10 loop
         X := X + 0.1;
      end loop;

      Put ("Suma de 0.1 diez veces = ");
      Put (X'Image);  -- Usa 'Image para convertir a string
      New_Line;

      Put ("Valor esperado         = ");
      Put (D'Image);
      New_Line;

      if X = 1.0 then
         Put_Line ("¡Son iguales!");
      else
         Put_Line ("¡NO son iguales!");
      end if;
   end Decimal_Exacto;

   procedure Redondeo is
      F : Float := 3.7;
      R : Float;
   begin
      R := Float'Rounding (F);      -- Redondea al entero más cercano como Float
      Put_Line ("Redondeado: " & Float'Image (R));  -- Imprime 4.0

      -- Convertir a Integer:
      declare
         I : Integer := Integer (Float'Rounding (F));
      begin
         Put_Line ("Como Integer: " & Integer'Image (I));  -- Imprime 4
      end;
   end Redondeo;

begin
   Imprecision;

   Put_Line ("--------------------");

   Decimal_Exacto;

   Put_Line ("--------------------");

   Redondeo;
   Put_Line ("--------------------");

   Put ("0.2          = ");
   Put (To_Bits (A), Base => 16);
   New_Line;

   Put ("0.3          = ");
   Put (To_Bits (B), Base => 16);
   New_Line;

   Put ("0.2 + 0.3    = ");
   Put (To_Bits (C), Base => 16);
   New_Line;

   Put ("0.5          = ");
   Put (To_Bits (D), Base => 16);
   New_Line;

   New_Line;
   if C = D then
      Put_Line ("¡Son iguales!");
   else
      Put_Line ("¡NO son iguales!");
   end if;
end Main;
