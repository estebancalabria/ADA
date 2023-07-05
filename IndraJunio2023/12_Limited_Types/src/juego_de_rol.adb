package body Juego_De_Rol is

   function "-" (Hp:Vida; Golpe:Fuerza) return Vida is
   begin
      return (if (Vida(Golpe)>Hp) then 0 else Hp-Vida(Golpe));      
   end;
      
   
   function Crear(Initial_Hp:Vida; Initial_Fuerza:Fuerza) return Jugador is
      Result : Jugador;
   begin
      Result.Hp := Initial_Hp;
      Result.Puntos_Fuerza := Initial_Fuerza;
      Result.Kills := 0;
      return Result;
   end Crear;
   
   function Esta_Vivo(P: Jugador) return Boolean is
   begin
      return P.Hp > 0;
   end;
   
   procedure Ataque(Atacante:Jugador; Atacado:out Jugador) is
   begin
      if Esta_Vivo(Atacante) and Esta_Vivo(Atacado) then
         Atacado.Hp := (Atacado.Hp-Atacante.Puntos_Fuerza); 
      end if;          
   end;
   
end Juego_De_Rol;
