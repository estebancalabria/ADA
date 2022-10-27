package IO is

   Default_String_Error_Message : String := "Entrada Vacia. Vuelva a Ingresar";
   Default_Integer_Error_Message : String := "No Ingreso un Numero.Vuelva a intentar";


   function Get_NotEmpty_Line
     (Prompt : String := "";
      Error_Message :String := Default_String_Error_Message) return String;

   function Try_Get_Integer
     (Value: out Integer) return Boolean;

   function Get_Integer
     (Prompt : String := "";
      Error_Message: String := Default_Integer_Error_Message) return Integer;
end IO;
