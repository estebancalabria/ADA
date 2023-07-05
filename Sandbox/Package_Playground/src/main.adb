with Ada.Text_IO; use Ada.Text_IO;
with Contador; use Contador;

procedure Main is

begin

   declare
      C:Cnt;
      D : Integer := 12;
   begin
      --C := 32;
      --C := C+1;
      Reset(C);
      for I in 1..20 loop

         Inc(C);
      end loop;

      Put_Line(AsInteger(C)'Image);

   end;


end Main;
