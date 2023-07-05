package contador is

   type Cnt is limited private;
   
   procedure Inc(C : in out Cnt);
   procedure Reset(C : in out Cnt);
   procedure Dec(C : in out Cnt);
   function AsInteger(C:Cnt) return Integer;

private

   type Cnt is new Integer with Default_Value => 0;
end contador;
