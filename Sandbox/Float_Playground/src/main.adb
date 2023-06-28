with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Long_Long_Float_Text_IO; use Ada.Long_Long_Float_Text_IO;

procedure Main is
   type D12 is digits 5;
   V : D12 := 0.0;
begin
   Put(Long_Long_Float(D12'First), Exp => 0 );
   New_Line;
   Put_Line(V'Size'Image);
   Put_Line(D12'First'Image);
   --  Insert code here.
   null;
end Main;
