with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Personaje is

   type Vida is new Integer range 0..1000;
   type Niveles is new Integer range 1..20;
   type Puntos_Experiencia is new Integer range  0..2000;
   
   type Clase_Campeon is tagged private;
   type Campeon is access Clase_Campeon;
   
   
   --Constructor
   function Create(Nombre:String) return Campeon;
   --Metodos de la clase Campeon
   --Se dan cuando el primer parametro es un tagged Record
   function To_String(This:Clase_Campeon) return String;

private
   
   type Clase_Campeon is tagged record
      Nombre : Unbounded_String;
      Hp : Vida := 1000;
      Nivel : Niveles;
      Experiencia : Puntos_Experiencia := 0;
      --Ej java 
      --To_String() return String;
   end record;
   
end Personaje;
