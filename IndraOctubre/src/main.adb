with Ada.Text_IO; use Ada.Text_IO;

procedure Main is


begin
   declare
     --type Montos is array (Integer range <>) of Float;
     type Dinero is digits 2;
     --Empieza en la posicion 1:
     type Montos is array (Positive range <>) of Dinero;
     --Empieza en la posicion 0:
     type Array_Natural is array (Natural range <>) of Dinero;
      --Empieza en la posicion Integer'First
      type Array_Integer is array (Integer range <>) of Dinero;
      --Inicializaciones
     --Ventas : Montos(1..5);
      Ventas : Montos := (10.0, 2.3, 6.7);
      Ventas_Natural_Range : Array_Natural := (4.5,3.4);
      Ventas_Integer_Range : Array_Integer := (6.7, 2.3);
   begin
     --  Insert code here.
     --Ventas(0) := 2.3; --Porque da error?
      Put_Line("Primera Posicion (Positive range <>) " & Ventas'First'Image);
      Put_Line("Primera Posicion (Natural range <>) " & Ventas_Natural_Range'First'Image);
      Put_Line("Primera Posicion (Integer range <>) " & Ventas_Integer_Range'First'Image);
   end;



   null;
end Main;
