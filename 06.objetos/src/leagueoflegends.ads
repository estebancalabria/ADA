with Ada.Strings.Unbounded;
use  Ada.Strings.Unbounded;

package LeagueOfLegends is
   
   type Nivel is range 1..18;
   type Vida is range 500..7000;
   type Experiencia is range 0..10000;
   type Personaje  is  (Elise,Lulu,Poppy,Teemo,Ekko,Irelia);
   
   
   type Heroe is tagged record
      Nombre:Personaje;
      PuntosDeVidaMaximos:Vida := 500;
      PuntosExperiencia:Experiencia := 0;
      NivelActual:Nivel := 1;
   end record;
   
   --Tenemos puntos de Vida
   --Los puntos de vida dependen del nivel
   --El nivel depende de la experiencia
   procedure GanarExperiencia(This:in out Heroe; XP:Experiencia);
   procedure MostrarInfo(This:Heroe);

end LeagueOfLegends;
