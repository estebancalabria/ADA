package Fruits is

   type Apples is new Natural;
   type Pears is new Natural;
   type Bananas is new Natural;
   
   function To_String(Item : Apples) return String;
   function To_String(Item : Pears) return String;
   function To_String(Item : Bananas) return String;

end Fruits;
