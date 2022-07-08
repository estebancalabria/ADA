package Transporte is
   
   type Metros is new Float;
   type KilometrosPorHora is new Float range 0.0..500.0;
   type Segundos is new Integer;

   type Vehiculo is tagged private;
   
   type PVehiculo is access Vehiculo;

   procedure Init(This: in out Vehiculo); --Constructor
   procedure Mostrar(This:Vehiculo);
   procedure Actualizar(This:in out Vehiculo; Tiempo:Segundos);
   procedure Set_Velocidad_X(This: in out Vehiculo; Velocidad:KilometrosPorHora);  --Setter

private

   type Vehiculo is tagged record
      VelocidadX : KilometrosPorHora;
      PosicionX : Metros;
   end record;
   
end Transporte;
