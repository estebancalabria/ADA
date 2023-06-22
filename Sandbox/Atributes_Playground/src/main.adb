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

function Leer_Integer_or_0 return Integer is
begin
   declare
      Res: Integer := Integer'Value(Get_Line);
   begin
      return Res;
   exception
       when others => return 0;
   end;
end;


   N : Integer;
   M : Metros := 5;
   Mi : Millas := 6;
begin
   N:= Leer_Integer_or_0;
   N := Integer'Last;
   --Put_Line(M'Tag);
   Put_Line(N'Image);
   Put_Line("En total " & M);
   M := +Mi;

   null;
end Main;
