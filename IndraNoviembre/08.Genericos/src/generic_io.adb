with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Characters.Handling; use Ada.Characters.Handling;

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
      Put_Line(Prompt);
      
      if (Tipo'Range_Length<50) then
         Show_Discrete;
      end if;
      
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
   
   function To_String(Item:Tipo) return String is 
   begin
      return Item'Image(1..1) & To_Lower(Item'Image(2..Item'Image'Length));
   end;
   
   procedure Show_Discrete is 
   begin
      Put("(");
      for EnumItem in Tipo'First..Tipo'Last loop
         Put(To_String(EnumItem));
         Put(if (EnumItem/=Tipo'Last) then "," else "");
      end loop;
      Put(")");
      Put_Line("");
   end;
   

   
   
end Generic_IO;
