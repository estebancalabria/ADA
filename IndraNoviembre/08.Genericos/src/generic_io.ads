generic
   type Tipo is (<>);  --El tipo es discreto
                           --
   
package Generic_IO is
   
   Default_Prompt : constant String := "Ingrese un valor";
   Default_Error_Message:constant String := "Ha ingresado un valor incorrecto. Vuelva a intentar.";

   function Try_Convert  
     (Valor_Como_String: in String;
      Valor_Convertido: out Tipo) return Boolean;
   
   --Se animan a programarlo
   function Get_Discrete
     (Prompt:String := Default_Prompt;
      Error:String := Default_Error_Message) return Tipo;

end Generic_IO;
