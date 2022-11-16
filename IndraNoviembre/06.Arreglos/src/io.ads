with Ada.Text_IO; use Ada.Text_IO;

package io is

   function Get_Non_Empty_Line
      (Prompt:String := "Ingrese un texto no vacio";
       Error:String := "Ha Ingresado un texto vacio, vuelva a intentarlo") return String;
   
   function Try_Convert_Integer
     (Texto:in String;
      Texto_Como_Entero:out Integer) return Boolean;
   
   function Try_Convert_Float
     (Texto:in String;
      Texto_Como_Float:out Float) return Boolean;

   
   function Get_Integer
     (Prompt:String := "Ingresa un numero";
      Error:String := "No ha ingresado un numero, vuelva a intentarlo") return Integer;

   function Get_Integer_Between
     (Min:Integer;
      Max:Integer;
      Prompt:String := "Ingrese un numero";
      Empty_Error:String := "Texto Vacio, Vuelva a Intentar";
      Underflow_Error:String := "Numero muy chico";
      Overflow_Error:String := "Numero muy grande") return Integer;
   
   procedure Reemplazar
     (Input: in out String; 
      Caracter_A_Reemplazar : in Character; 
      Caracter_Reemplazo : in Character);
   
   --Firma del get Float
   function Get_Float     
     (Prompt : String := "Ingrese un texto de tipo Float.";      
      Error  : String := "Ingrese un texto numerico.";
      Separador_Decimales : Character := ',') return Float;
   
   function To_String
     (Input:Float;
      Cantidad_Decimales : Integer := 2;
      Separador_Decimales : Character := ',') return String;

end io;
