with Ada.Text_IO; use Ada.Text_IO;
with IO; use IO;

generic
   type Enum_Type is (<>);
package IO_Enums is
   
   Default_Error_Message : String := "Entrada Invalida. Reintente";

   function Try_Get_Enum(Enum: out Enum_Type) return Boolean;
   function Get_Enum(Prompt : String := "";
                     Error_Message :String := Default_Error_Message)
                     return Enum_Type;
end IO_Enums;
