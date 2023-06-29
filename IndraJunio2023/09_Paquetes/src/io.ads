package Io is

   function Prompt
     (Mensaje:String:="Ingresar un string no vacío";
      Error_String_vacio:String:= "Ha ingresado un String vacío") return String;
   

   function Prompt
     (Mensaje:String:="Ingrese un Numero";
      Mensaje_Error:String:= "No ha ingresado un numero") return Integer;
  
   function "&"(Str:String; N:Integer) return String;

end Io;
