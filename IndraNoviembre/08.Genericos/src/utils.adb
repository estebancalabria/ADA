with Ada.Text_IO; use Ada.Text_IO;

package body Utils is

   procedure Swap(Left, Right: in out T) is
      Aux : T := Left;
   begin
      Left := Right;
      Right := Aux;
   end;
   
   procedure Show_Vertical(Value:T) is
   begin
      for C of To_String(Value) loop
         Put_Line(C'Image);
      end loop;
   end;
   
   

end Utils;
