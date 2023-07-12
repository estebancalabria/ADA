with Ada.Text_IO, Ada.Strings.Fixed, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Strings.Fixed, Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;


procedure Main is



   function F_EXPAND_STRING(Str : in String; Default_Value : in Character) return String is

      V_STRING_EXPANDED : String(1 .. 8);

   begin

      V_STRING_EXPANDED (1 .. 5) := Str;

      V_STRING_EXPANDED (6 .. V_STRING_EXPANDED'Last) := (others => Default_Value);

      return V_STRING_EXPANDED;

   end F_EXPAND_STRING;



   function F_EXPAND_STRING_CUSTOM(Str : in String; Default_Value : in Character; Custom_Length : in Positive) return String is

      V_STRING_EXPANDED_CUSTOM : String(1 .. Custom_Length);

   begin

      V_STRING_EXPANDED_CUSTOM (1 .. 5) := Str;

      V_STRING_EXPANDED_CUSTOM (6 .. V_STRING_EXPANDED_CUSTOM'Last) := (others => Default_Value);

      return V_STRING_EXPANDED_CUSTOM;

   end F_EXPAND_STRING_CUSTOM;

    type F is new Long_Float;
    Monedas : array (1..8) of F := (2.0, 1.0, 0.5, 0.2, 0.1, 0.05, 0.02, 0.01);
    Vuelto : F;
   Cantidad_Monedas : Integer;
   Actual : F;
begin
      Vuelto := 1.41;
     Actual := Vuelto;

   For N of Monedas loop
      Cantidad_Monedas := 0;
      while (Actual>=N) loop
         Cantidad_Monedas := Cantidad_Monedas +1;
         Actual := Actual - N;
         Put(Float(Actual), Exp=>0, Aft=>2);
         New_Line;
      end loop;


      --Cantidad_Monedas  := Integer(F'Floor(Actual / N));
      --Cantidad_Monedas_Float := F'Remainder(Actual,N);
      Put("  >> Se Devuelve ");
      --Put(Float(Cantidad_Monedas_Float), Exp =>0, Aft => 2);
      Put(Cantidad_Monedas'Image & " de ");
      Put(" de ");
      Put(Float(N), Exp =>0, Aft => 2);
      New_Line;
      --Actual := Actual - N * F(Cantidad_Monedas);
   end loop;

   Vuelto := 1.41;
     Actual := Vuelto;
   For N of Monedas loop
      Cantidad_Monedas := 0;
      Put(Float(N), Exp=>0, Aft=>2);
      New_Line;

      if (Actual-N < Float'Epsilon) then
      end if;


      if (Actual>=N) then
         Put_Line("Es mayor");
      else
         Put_Line("Es Menor ");
         Put(Float(Actual-N),Exp =>0, Aft=>2);
         New_Line;
      end if;

      while (Actual>=N) loop
         Cantidad_Monedas := Cantidad_Monedas +1;
         Actual := Actual - N;
         Put(Float(Actual), Exp=>0, Aft=>2);
         New_Line;
      end loop;


      --Cantidad_Monedas  := Integer(F'Floor(Actual / N));
      --Cantidad_Monedas_Float := F'Remainder(Actual,N);
      Put(Float(Actual) / Float(N), Exp=>0, Aft=>2);
      Put(Float(F'(Actual / N)), Exp=>0, Aft=>2);
      Put(Integer(F'Floor(Actual / N))'Image);
      Put("  >> Se Devuelve ");
      --Put(Float(Cantidad_Monedas_Float), Exp =>0, Aft => 2);
      Put(Cantidad_Monedas'Image & " de ");
      Put(" de ");
      Put(Float(N), Exp =>0, Aft => 2);
      New_Line;
      --Actual := Actual - N * F(Cantidad_Monedas);
   end loop;


   --  declare
   --
   --     V_STRING_1 : String(1 .. 5);
   --
   --     V_FILLING_CHAR : Character;
   --
   --     V_STRING_2 : String(1 .. 8);
   --
   --     V_LENGTH_C : Positive;
   --
   --  begin
   --     Put_Line("Introduzca un string de 5 caracteres:");
   --     V_STRING_1 := Get_Line;
   --     Put_Line("Introduzca un carácter para rellenar el resto del nuevo string:");
   --     --V_FILLING_CHAR := Character'Value(Get_Line);
   --     --Put_Line("----");
   --     --Get(V_FILLING_CHAR);
   --     V_FILLING_CHAR := Get_Line(1);
   --
   --     V_STRING_2 := F_EXPAND_STRING(V_STRING_1, V_FILLING_CHAR);
   --     Put_Line("Aquí tiene el string expandido:");
   --     Put_Line(V_STRING_2);
   --     New_Line;
   --
   --
   --     Put_Line("Ahora introduza la longitud del nuevo string que quiere:");
   --
   --     V_LENGTH_C := Positive'Value(Get_Line);
   --     --Get(V_LENGTH_C);
   --
   --     declare
   --        V_STRING_C : String(1 .. V_LENGTH_C);
   --        V_STRING_3 : String(1 .. 5);
   --        V_FILLING_CHAR_C : Character;
   --     begin
   --        Put_Line("Introduzca de nuevo un string de 5 caracteres:");
   --        V_STRING_3 := Get_Line;
   --        Put_Line("Introduzca un carácter para rellenar el resto del nuevo string:");
   --        V_FILLING_CHAR_C := Get_Line(1);
   --        --Get(V_FILLING_CHAR_C);
   --        V_STRING_C := F_EXPAND_STRING_CUSTOM(V_STRING_3, V_FILLING_CHAR_C, V_LENGTH_C);
   --        Put_Line("Aquí tiene el string expandido:");
   --        Put_Line(V_STRING_C);
   --     end;
   --  end;





end Main;
