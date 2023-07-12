package Utils is

   type Contador is tagged record
   --type Contador is class
      Valor:Integer := 0;
   end record;
   
   procedure Inc(This: in out Contador);

end Utils;
