package UtilidadesTipos is

   generic
      type T is (<>);
      ConvertedValue:in out T;
      function IS_Type(Value:String) return Boolean;

end UtilidadesTipos;
