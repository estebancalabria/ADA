with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;

package P_Persona is
   -- Java
   --  class Persona{
   --    Nombre:String;
   --    Apellido:String;
   --    public void Saludar(){
   --        System.out.println("Hola soy " + this.Nombre + "  " + this.Apellido)
   --    }
   --  }
   
   -- Python
   --  class Person:
   --    def __init__(self, name, age):
   --       self.Nombre = name
   --       self.Apellido = age


   type C_Persona is tagged record
      Nombre:Unbounded_String;               
      Apellido:Unbounded_String;         
   end record;
   
   type Persona is access C_Persona'Class;
   
   procedure Saludar(This: C_Persona);
   
end P_Persona;
