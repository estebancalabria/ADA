with Juego; use Juego;
with Ada.Containers.Vectors;

procedure Main is
   Batman : PPersonaje;
   package EnemigosV is new Ada.Containers.Vectors(Index_Type => Natural,
                                                   Element_Type => PPersonaje);

   Enemigos : EnemigosV.Vector;
   Enemigo : PPersonaje;
begin
   Batman := new THeroe;
   Batman.Init("Batman");
   Batman.Mostrar;

   for I in 1..10 loop
      Enemigo := new TEnemigo;
      Enemigo.Init("Enemigo " & I'Image);
      Enemigos.Append(Enemigo);
   end loop;

   for E of Enemigos loop
      E.Mostrar;
   end loop;

end Main;
