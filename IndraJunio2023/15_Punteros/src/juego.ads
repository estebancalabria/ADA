package juego is
   type String_Access is access String;
   type Vida is range 1..100000; 
   type Nivel is range 1..99;
   type Fuerza is range 1..200;
   type Clase is (Guerrero,Mago, Clerigo, Picaro);
   type Jugador is limited private;
   --Metodos
   function Crear (Nombre : String) return Jugador;
   procedure Set_Clase (This : in out Jugador; Valor:Clase);
   procedure Set_Fuerza (This : in out Jugador; Valor:Fuerza);
   procedure Set_Hp (This : in out Jugador; Valor:Vida);
   procedure Mostrar (This : in Jugador);
private 
   type Jugador is record
      Nombre : String_Access;      
      Hp: Vida;      
      Hp_MAX: Vida;      
      Str: Fuerza;      
      Lvl: Nivel := 1;      
      Class:Clase;      
   end record;  
end juego;
