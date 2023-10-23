with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

package body Consola is

   function F_Es_Numero(Item : String) return Boolean is
     Conversion : Integer;
   begin
      Conversion := Integer'Value(Item);
      return True;
   exception
      when others => return False;
   end F_Es_Numero;
   
   function F_Get_Line_Not_Empty
     (Empty_Error_Message : String := Default_Empty_Error_Message) return String is
      use Ada.Strings.Fixed;
   begin
      loop
         declare
            Entrada : String := Get_Line;
         begin
            if Trim(Entrada,Ada.Strings.Both)'Length > 0 then
               return Entrada;
            end if;

            Put_Line(Empty_Error_Message);
         end;
      end loop;
   end;
   
   function F_Get_Integer
     (Empty_Error_Message : String := Default_Empty_Error_Message;
     Not_Integer_Error_Message:String  := Default_Not_Integer_Error_Message
     ) return Integer is
   begin
      loop
         declare
            V_String : String := F_Get_Line_Not_Empty;
         begin
            if f_es_numero(v_string) then
               return Integer'Value(v_string);
            end if;
            Put_Line(Not_Integer_Error_Message);
         end;
      end loop;
   end;

end Consola;
