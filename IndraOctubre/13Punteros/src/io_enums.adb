package body IO_Enums is

   function Try_Get_Enum(Enum: out Enum_Type) return Boolean is
   begin
      Enum := Enum_Type'Value(Get_NotEmpty_Line);
      return True;
   exception
      when others => return False;
   end;
   
   function Get_Enum(Prompt : String := "";                     
                     Error_Message :String := Default_Error_Message)
                     return Enum_Type is
      EntradaCorrecta : Boolean;
      Result: Enum_Type;
   begin
      if (Prompt'Length>0) then
         Put_Line(Prompt);
      end if;

      for P in Enum_Type loop
         --Put_Line(To_String(P));
         Put_Line(P'Image);
      end loop;

      loop
         EntradaCorrecta := Try_Get_Enum(Result);
         if (EntradaCorrecta) then
            return Result;
         end if;
         Put_Line(Error_Message);
      end loop;
   end;

end IO_Enums;
