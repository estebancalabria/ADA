package Generic_Demo is

   generic type T is private; --private significa cualqier tipo
   procedure Generic_Swap(Value1: in out T;
                          Value2: in out T); --Primero lo defino

end Generic_Demo;
