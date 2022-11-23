with Ada.Text_IO;

procedure Main is
   use Ada.Text_IO;
   Numero : Integer;
   --NumeroAsString : String (1..3); --Forma Explicita de Declarar String
begin
   Numero := 10;
   --NumeroAsString := Numero'Image;
   --Put_Line(Integer'Image(Numero));
   --Put_Line(Numero'Image);
   --Put_Line(NumeroAsString);
   declare
      NumeroAsString : String := Numero'Image; --Forma Implicita de declarar un String
   begin
      Put_Line("El Numero es:" & NumeroAsString);
      Put_Line("La Longitud del string es" & NumeroAsString'Length'Image);
   end;
end Main;
