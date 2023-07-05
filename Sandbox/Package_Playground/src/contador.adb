package body contador is

   procedure Inc(C : in out Cnt) is
   begin
      C := C+1;
   end;
     
   procedure Reset(C : in out Cnt) is
   begin
      C := 0;
   end;
   
   procedure Dec(C : in out Cnt) is
   begin
      C := C-1;
   end;
   
   
   function AsInteger(C:Cnt) return Integer is
   begin
      return Integer(C);
   end;
   


end contador;
