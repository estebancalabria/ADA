package body Secreto is

   procedure Set_Valor_Secreto(Variable: in out Valor_Secreto; Valor:in Integer) is
   begin
      if ((Valor mod 2) = 0) then
         raise Invalid_Value with "El valor secreto no puede ser par";
      end if;
        
      Variable := Valor_Secreto(Valor);
      
      --Ninguna de las siguientes asignaciones es valida
      --  declare
      --     V : Valor_Secreto;
      --     I : Integer;
      --  begin
      --    V:= I;
      --    I := V;
      --  end;
   end Set_Valor_Secreto;
   
   function Get_Valor_Secreto(Variable:in Valor_Secreto) return Integer is
   begin
      return Integer(Variable);      
   end Get_Valor_Secreto;
   

end Secreto;
