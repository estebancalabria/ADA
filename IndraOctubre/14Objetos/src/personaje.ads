with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Personaje is

   type Vida is new Integer range 0..1000;
   type Niveles is new Integer range 1..20;
   type Puntos_Experiencia is new Integer range  0..2000;
   
   type Clase_Campeon is tagged private;
   --Puedo Poner cualquiera de las dos dependiendo si tengo subclases
   --type Campeon is access Clase_Campeon; --final, sin subclases
   type Campeon is access Clase_Campeon'Class; --puedo tener subclases 
   
   --Constructor
   function Create(Nombre:String) return Campeon;
   
   --Metodos de la clase Campeon
   --Se dan cuando el primer parametro es un tagged Record
   
   --Getters y Setters
   --Getters
   function Get_Nombre(This:Clase_Campeon) return String;
   function Get_Nivel(This:Clase_Campeon) return Niveles;
     
   --Otros Metodos
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
