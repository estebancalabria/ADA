with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Characters.Handling; use Ada.Characters.Handling;

package Juego is
   
   Default_Max_Hp : constant Integer := 1000;
   Default_Max_Level : constant Integer := 20;

   type Profesiones is (Guerro, Mago, Asesino, Ninja, Sanador) with Default_Value => Guerro;
   
   type Niveles is range 1..Default_Max_Level with Default_Value => 1;
   
   type Vida is range 0..Default_Max_Hp with Default_Value => 100;
   
   type Jugador is record
      Nombre:Unbounded_String;
      Profesion : Profesiones;
      Nivel : Niveles;
      Hp : Vida;
   end record;   
   
   type Jugadores is array (Positive range <>) of Jugador;
   
   function To_String(Value:in Jugador) return String;
   function To_String(Value: in Profesiones) return String;

end Juego;
