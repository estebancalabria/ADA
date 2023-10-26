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
      
end Consola;
