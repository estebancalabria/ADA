with Ada.Text_IO;
with Ada.Integer_Text_IO;
--with Ada.Strings;
with Ada.Strings.Fixed;

procedure Main is
   use Ada.Text_IO;
   use Ada.Integer_Text_IO;
--   use Ada.Strings;
   use Ada.Strings.Fixed;

   type De_Uno_A_Cien is range 1..100;
   --type Tipo_Flotante is new Float range (1.4)..(3.5);
   --type De_Uno_A_Cien is new Integer range 1..100;
begin
   Put_Line("Ingrese un numero");
   --Put_Line("El numero tiene entrar en" & Integer'Size'Image & " bits");
   --Put_Line("El numero debe estar entre " & Integer'First'Image  &" y" & Integer'Last'Image);

   --Put_Line("El numero tiene entrar en" & Natural'Size'Image & " bits");
   --Put_Line("El numero debe estar entre " & Natural'First'Image  &" y" & Natural'Last'Image);

   --Put_Line("El numero tiene entrar en" & Positive'Size'Image & " bits");
   --Put_Line("El numero debe estar entre " & Positive'First'Image  &" y" & Natural'Last'Image);

   --Uno de 64 bits flotante!
   --Put_Line("El numero tiene entrar en" & Duration'Size'Image & " bits");
   --Put_Line("El numero debe estar entre " & Duration'First'Image  &" y" & Duration'Last'Image);

   --Put_Line("El numero tiene entrar en" & Long_Long_Integer'Size'Image & " bits");
   --Put_Line("El numero debe estar entre " & Long_Long_Integer'First'Image  &" y" & Long_Long_Integer'Last'Image);

    --Put_Line("El numero tiene entrar en" & Short_Short_Integer'Size'Image & " bits");
    --Put_Line("El numero debe estar entre " & Short_Short_Integer'First'Image  &" y" & Short_Short_Integer'Last'Image);

   Put_Line("El numero tiene entrar en" & De_Uno_A_Cien'Size'Image & " bits");
   Put_Line("El numero debe estar entre " & De_Uno_A_Cien'First'Image  &" y" &  De_Uno_A_Cien'Last'Image);


   declare
      --Numero : Integer;
      --Numero : Natural;
      --Numero: Positive;
      Numero : De_Uno_A_Cien;
      Entrada : String := Get_Line;
   begin
      --Numero := Integer'Value(Entrada);
      --Numero := Natural'Value(Entrada);
      --Numero := Positive'Value(Entrada);
      Numero := De_Uno_A_Cien'Value(Entrada);
      Put_Line("Usted ha ingresado un numero como se le ha pedido");
      Put_Line("El numero ingresado es " & Trim(Numero'Image, Ada.Strings.Both));
   exception
      when others => Put_Line("Usted ha hecho trampa y no ha ingresado un numero");
   end;

   --Bonus Track 1
   declare
      F : Float;
   begin
      --F := 1;  --Invalido
      F := 1.0; --Valido
   end;

   declare
      Valor : Integer := 1347;
      Cadena : String := Valor'Image;
   begin
      Put_Line(Cadena);
   end;
end Main;
