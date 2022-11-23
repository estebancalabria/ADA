with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   task Subtarea;

   task OtraSubtarea is
      entry Inicio;
   end;

   task body Subtarea is
   begin
      For I in 1..100 loop
         Put_Line("Subtarea cuenta " & I'Image);
         delay 0.3;
      end loop;

      OtraSubtarea.Inicio;
   end;

   task body OtraSubtarea is
   begin
      accept Inicio;

      For I in 1..100 loop
         Put_Line("Otra Subtarea dice " & I'Image);
         delay 0.3;
      end loop;
   end;

begin
   For I in 1..100 loop
      Put_Line("El programa principal dice " & I'Image);
      delay 0.2;
   end loop;
end Main;

