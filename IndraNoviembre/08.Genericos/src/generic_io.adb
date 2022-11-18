with Ada.Text_IO; use Ada.Text_IO; 

package body Generic_IO is

   function Try_Convert  
     (Valor_Como_String: in String;
      Valor_Convertido: out Tipo) return Boolean is
   begin
      Valor_Convertido := Tipo'Value(Valor_Como_String);
      return True;
   exception
      when others => return False;         
   end;  
   
   function Get_Discrete
     (Prompt:String := Default_Prompt;      
      Error:String := Default_Error_Message) return Tipo is
   begin      
      Tipo'
      Put_Line(Prompt);
      Entrada_Datos : loop
         declare
            Algo_En_Texto: String := Get_Line;
            Valor : Tipo;         
         begin            
            if (Try_Convert(Algo_En_Texto, Valor)) then
               return Valor;
            end if;
            Put_Line(Error);
         end;
      end loop Entrada_Datos;
   end Get_Discrete;
end Generic_IO;
