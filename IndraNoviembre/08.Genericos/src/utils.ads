package Utils is

   generic
      type T is private;
   procedure Swap(Left, Right: in out T);
      

   generic 
      type T is private;
      with function To_String(Value:T) return String;
   procedure Show_Vertical(Value:T);
      
end Utils;
