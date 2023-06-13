with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Persona_Model is

   --type C_Persona is abstract tagged private;
   type C_Persona is abstract tagged record
     Nombre:Unbounded_String;
   end record;
   
   type Persona is access all C_Persona'Class;
   
   --Como la clase C_Persona es abstracta no voy a tener un constructor
   function To_String(This:C_Persona) return String is abstract;
  
   function Get_Nombre(This:in C_Persona) return String;
   procedure Set_Nombre(This:out C_Persona; Value:String);
  
--private
   
   --type C_Persona is abstract tagged record
   --  Nombre:Unbounded_String;
   --end record;
   
end Persona_Model;
