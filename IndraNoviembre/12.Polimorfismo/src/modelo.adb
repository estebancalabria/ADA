package body modelo is

   function To_String(This:Clase_Iguana) return String is
   begin
      return "Soy una Iguana";
   end To_String;
   
   function To_String(This:Clase_Gallina) return String is
   begin
      return "Soy una Gallina"; 
   end To_String;
   
end modelo;
