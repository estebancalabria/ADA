package Secreto is

   Invalid_Value : exception;
   
   type Valor_Secreto is limited private; --No funciona ni la asignacion, ni la suma, ni nada, solo los metodos

   procedure Set_Valor_Secreto(Variable: in out Valor_Secreto; Valor:in Integer);
   
   function Get_Valor_Secreto(Variable:in Valor_Secreto) return Integer;
   
private
   
  type Valor_Secreto is new Integer with Default_Value => 0;
   
end Secreto;
