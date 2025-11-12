package Demo_Subtypes is

   --subtypes add more scemantic to your code and adds some type checking
   
   subtype Age is Natural range 0..150;
   subtype Age_Underage is Age range 0..17;
   subtype Age_Adult is Age range 18..70;
   subtype Age_Old is Age range 71..150;
   
   function To_String(Item : Age) return String;
end Demo_Subtypes;
