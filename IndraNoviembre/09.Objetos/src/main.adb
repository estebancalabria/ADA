with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with P_Persona; use P_Persona;

procedure Main is
begin

   -- Java
   --  class Persona{
   --    Nombre:String;
   --    Apellido:String;
   --  }

   -- Python
   --  class Person:
   --    def __init__(self, name, age):
   --       self.Nombre = name
   --       self.Apellido = age


   declare


      type C_Heroe is tagged record
         Nombre : Unbounded_String;
         Fuerza: Integer;
         Puntos_De_Vida : Integer;
      end record;
      type Heroe is access C_Heroe'Class;



      Una_Persona : Persona := null;
      Un_Heroe : Heroe := null;

      --Crear e instanciar una clase llamada "Heroe"
      --Los heroes tienen un nombre, fuerza y puntosDeVida(hp)

   begin

      Una_Persona := new C_Persona'(Nombre => To_Unbounded_String("Esteban"),
                                    Apellido => To_Unbounded_String("Calabria"));
      --Saludar(Una_Persona);
      Una_Persona.Saludar;

      Un_Heroe := new C_Heroe'(Nombre => To_Unbounded_String("Drax"),
                               Fuerza => 1000,
                               Puntos_De_Vida => 500);
   end;


   null;
end Main;
