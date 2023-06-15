with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   for Integer'Size use 64;
   N : Integer;
begin
   N := Integer'Last;
   Put_Line(N'Image);
   null;
end Main;
