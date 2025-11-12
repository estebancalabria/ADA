package body Demo_Subtypes is

   function To_String(Item : Age) return String is
   begin
      return Item'Image & " years old";
   end;
   


end Demo_Subtypes;
