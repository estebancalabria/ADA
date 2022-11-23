with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Consola is

    function Get_NotEmpty_String(pregunta : String) return Unbounded_String 
    with
       Pre => pregunta'Length > 0, 
       Post => Length(Get_NotEmpty_String'Result) > 0;

   function Is_Integer(NumericString:String) return Boolean;
   
   function Is_Float (NumericString : String) return Boolean;

   function Get_NotEmpty_Integer(Pregunta : String) return Integer;
   
   function Get_NotEmpty_Float(Pregunta : String) return Float;
   
end consola;
