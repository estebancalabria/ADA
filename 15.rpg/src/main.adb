with Juego; use Juego;
with Ada.Containers.Vectors;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Main is
   Batman : PPersonaje;
   package EnemigosV is new Ada.Containers.Vectors(Index_Type => Natural,
                                                   Element_Type => PPersonaje);

   Enemigos : EnemigosV.Vector;

   task MostrarEnemigos is
      entry Empezar;
   end MostrarEnemigos;

   task body MostrarEnemigos is
   begin
      accept Empezar;
      loop
         for E of Enemigos loop
            E.Mostrar;
         end loop;

         delay 10.0;
     end loop;
   end;

   task MoverEnemigos is
      entry Empezar;
   end MoverEnemigos;

   task body MoverEnemigos is
      G:Generator;
      Numero_Al_Azar : Uniformly_Distributed;
      Direccion_Al_Azar : TDireccion;
   begin
      accept Empezar;
      loop
         for E of Enemigos loop

            Numero_Al_Azar := Random(G);
            if (Numero_Al_Azar < 0.25) then
               Direccion_Al_Azar := Norte;
            elsif (Numero_Al_Azar in 0.25..0.5) then
               Direccion_Al_Azar := Este;
            elsif (Numero_Al_Azar in 0.5..0.75) then
               Direccion_Al_Azar := Sur;
            else
               Direccion_Al_Azar := Oeste;
            end if;

            E.Mover(Direccion_Al_Azar);
         end loop;
         delay 1.0;
      end loop;
    end;


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

   MostrarEnemigos.Empezar;
   MoverEnemigos.Empezar;
end Main;
