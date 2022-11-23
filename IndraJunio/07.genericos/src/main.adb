with Pokedex; use Pokedex;
with UtilidadesTipos; use UtilidadesTipos;

procedure Main is
   Pika : Pokemon;
   --function Is_HP is new Try_Convert(T => PuntosDeVida);  --Instanciando un metodo generico
   --function IS_dsd  is new Is_Type(T => PuntosDeVida);
   procedure Get_HP is new Get_From_Console(TT => PuntosDeVida);
begin
   Pika.Tipo := Pikachu;
   --Pika.Vida := Get_PuntosDeVida;
   Get_HP(Pika.Vida);
   Pika.Ubicacion.Long := -20.0;
   Pika.Ubicacion.Lat := Get_Latitud;
   Pika.Mostrar_Info;
   --  Insert code here.
   null;
end Main;
