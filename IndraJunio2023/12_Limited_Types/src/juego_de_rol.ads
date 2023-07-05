package Juego_De_Rol is

 type Vida is new Natural;
 type Fuerza is new Natural;
 type Muertes is new Natural;
   
 type Jugador is limited private;
      
 function Crear(Initial_Hp: Vida; Initial_Fuerza:Fuerza) return Jugador;
 function Esta_Vivo(P: Jugador) return Boolean;
 procedure Ataque(Atacante:Jugador; Atacado: out Jugador);

private
   
   type Jugador is record
      Hp: Vida := 0;
      Puntos_Fuerza:Fuerza := 0;
      Kills:Muertes := 0;
   end record;

end Juego_De_Rol;
