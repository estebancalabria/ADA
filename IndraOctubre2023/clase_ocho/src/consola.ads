with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Consola is

   Default_Empty_Error_Message: constant String := "Se esperaba una entrada no vacia. Vuelva a Intentar.";
   Default_Not_Integer_Error_Message: constant String := "Se esperaba un numero. Vuelva a Intentar.";
   
   function F_Es_Numero(Item : String) return Boolean;
   
   function F_Get_Line_Not_Empty
     (Empty_Error_Message : String := Default_Empty_Error_Message) return String;
   
   function F_Get_Integer
     (Empty_Error_Message : String := Default_Empty_Error_Message;
     Not_Integer_Error_Message:String  := Default_Not_Integer_Error_Message
     ) return Integer;
   
   function F_Prompt
     (V_Pregunta:String;
      Empty_Error_Message : String := Default_Empty_Error_Message) return String;
   
   function F_Prompt
     (V_Pregunta:String;
      Empty_Error_Message : String := Default_Empty_Error_Message) return Unbounded_String;

   function F_Prompt
     (V_Pregunta:String;
      Empty_Error_Message : String := Default_Empty_Error_Message;
      Not_Integer_Error_Message:String  := Default_Not_Integer_Error_Message) return Integer;
   
   generic
      type T is private;
      with function Cast_To_Type(V_Valor:String) return T;
   function F_Generic_Prompt
     (Mensaje : String := "Ingrese un valor";
      Error_Message:String := "Error de Ingreso. Vuelva a Intentar") return T;
   
   --Si funciona puedo tener solo este, pero lo repito por un tema didactico
   --Para que se vean las dos posibilidades
   generic
      type T_Non_Definitive (<>) is private;
      with function Cast_To_Type(V_Valor:String) return T_Non_Definitive;
   function F_Generic_Non_Definitive_Prompt
     (Mensaje : String := "Ingrese un valor";
      Error_Message:String := "Error de Ingreso. Vuelva a Intentar") return T_Non_Definitive;

   --Si funciona puedo tener solo este, pero lo repito por un tema didactico
   --Para que se vean las dos posibilidades
   generic
      type T_Discrete is (<>);    --Integer o Enumerado o Modular
      --No lo necesito porque se que los tipos discretos tienen el 'Value
      --with function Cast_To_Type(V_Valor:String) return T_Discrete; 
   function F_Generic_Discrete_Prompt
     (Mensaje : String := "Ingrese un valor";
      Error_Message:String := "Error de Ingreso. Vuelva a Intentar") return T_Discrete;
   
      
end Consola;
