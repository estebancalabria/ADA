package Pokedex is

   type TipoPokemon is (Pikachu, Blatsoise, Metagross, Mew, Tyranitar, Charizad, Jigglypuff);
   type PuntosDeVida is range 20..600;
   type Latitud is new Float range  -90.0..90.0;
   type Longitud is new Float range -180.0..180.0;
   
   type Coordenadas is tagged record
      Lat : Latitud;
      Long : Longitud;
   end record;
   
   type Pokemon is tagged record
      Tipo : TipoPokemon;
      Vida : PuntosDeVida;
      Ubicacion : Coordenadas;
   end record;
   
   --holaMundo <-- camelCase
   --HolaMundo <-- pascalCase
   --Hola_Mundo <-- snake_case
   --Hola-Mundo <-- notacion-Kebab
   
   procedure Mostrar_Info(This:Pokemon);
   
   function Is_PuntosDeVida(Value:String) return Boolean;
   function Is_TipoDePokemon(Value:String) return Boolean;
   function Is_Latitud(Value:String) return Boolean;
   function Is_Longitud(Value:String) return Boolean;
   
   function Get_PuntosDeVida return PuntosDeVida;
   function Get_Latitud return Latitud;
   --Y el resto...
   
end Pokedex;
