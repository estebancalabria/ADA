with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

package P_Persona is

   type C_Persona is tagged record
      Nombre:Unbounded_String;               
      Apellido:Unbounded_String;         
   end record;
   
   type Persona is access C_Persona'Class;
   
   procedure Saludar(This: C_Persona);
   
end P_Persona;
