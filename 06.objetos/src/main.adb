with LeagueOfLegends;

procedure Main is
   use LeagueOfLegends;
   hero : Heroe;
begin
   hero.Nombre := Ekko;

   -- MostrarInfo(hero); --Al estilo programacion estructurada
   hero.MostrarInfo;   --Estilo Orientado a Objetos
   hero.GanarExperiencia(800);
   hero.GanarExperiencia(700);
   hero.MostrarInfo;
end Main;
