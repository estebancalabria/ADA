package UtilidadesTipos is

   generic 
      --type T is private;   --Hace referencia Cualquier tipo de datos
      type T is (<>);      --Hace referencia a un tipo discreto
      --type T is digits <>; --Hace referencia a fipos flotantes
                             
   function Try_Convert(Value:String; ConvertedValue: out T) return Boolean;
   
   generic type TT is (<>);
   procedure Get_From_Console(Value: out TT);
   
   --function Is_Type(Value:String) return Boolean;
end UtilidadesTipos;
