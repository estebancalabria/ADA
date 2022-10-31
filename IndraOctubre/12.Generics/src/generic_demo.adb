package body Generic_Demo is

   procedure Generic_Swap(Value1: in out T;
                          Value2: in out T) is --Luego lo declaro
      Aux:T;
   begin
      Aux := Value1;
      Value1 := Value2;
      Value2 := Aux;
   end;

end Generic_Demo;
