with Ada.Text_IO; use Ada.Text_IO;

package body utils is

     function Generic_Prompt
        (V_MSG : String := "Introduzca un valor: ";
         V_MSG_ERROR : String := "Valor Incorrecto") return T is
      begin
         loop
            begin
               Put_Line(V_MSG);
               return T'Value(Get_Line);               
            exception when others => Put_Line(V_MSG_ERROR);
            end;
         end loop;
      end Generic_Prompt;

end utils;
