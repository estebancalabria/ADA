pragma Ada_2012;
package body UtilidadesTipos is


   function IS_Type (Value : String) return Boolean is
   begin
      ConvertedValue := T'Value(Value);
      return true;
   exception
      when others => return false;
   end;


end UtilidadesTipos;
