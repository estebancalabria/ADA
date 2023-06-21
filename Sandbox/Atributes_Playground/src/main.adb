with Ada.Text_IO; use Ada.Text_IO;




procedure Main is

   --for Integer'Size use 64;

   type Metros is new Integer;
   type Millas is new Integer;

   function "+" (M:Millas) return Metros is
   begin
      return Metros(M);
   end;

   function "&" (A:String; B:Metros) return String is
   begin
      return A & B'Image & " Metros";
   end;



   N : Integer;
   M : Metros := 5;
   Mi : Millas := 6;
begin
   N := Integer'Last;
   --Put_Line(M'Tag);
   Put_Line(N'Image);
   Put_Line("En total " & M);
   M := +Mi;

   null;
end Main;
