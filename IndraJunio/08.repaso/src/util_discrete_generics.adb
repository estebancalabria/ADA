pragma Ada_2012;
package body Util_Discrete_Generics is

   ----------
   -- Swap --
   ----------

   procedure Swap (Left : in out T; Right : in out T) is
     Temp : T;
   Begin
     Temp := Left;
     Left := Right;
     Right := Temp;
   end;

   function Add (A, B : in TT) return TT is
   begin
      return A+B;
   end Add;

end Util_Discrete_Generics;
