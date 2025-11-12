package body Fruits is

   function To_String(Item : Apples) return String is
   begin
      --Similar to ternary operator in other languages
      return Item'Image & (if (item=1) then " apple" else " apples"); 
   end; 
   
   function To_String(Item : Pears) return String is
   begin
      return Item'Image & " pears";      
   end;
   
   function To_String(Item : Bananas) return String is
   begin
      return Item'Image & " banana";      
   end;
   

end Fruits;
