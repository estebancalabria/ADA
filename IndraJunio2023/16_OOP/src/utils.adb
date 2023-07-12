package body Utils is

   procedure Inc(This: in out Contador) is
   begin
      This.Valor := This.Valor+1;
   end;

end Utils;
