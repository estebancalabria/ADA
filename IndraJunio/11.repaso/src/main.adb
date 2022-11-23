with Transporte; use Transporte;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Vectors;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

procedure Main is
   package Lista_Vehiculos is new Ada.Containers.Vectors
     (Index_Type => Natural, Element_Type => PVehiculo);

   Movil : PVehiculo;
   Moviles : Lista_Vehiculos.Vector;
   --Semilla : Generator;
begin
   --  --Para Un Solo Vehiculo
   --  Movil := new Vehiculo;
   --  Movil.PosicionX := 0.0;
   --  Movil.VelocidadX := 10.0;
   --  Movil.Mostrar;
   --  Put_Line("Despues de media hora...");
   --  Movil.Actualizar(1800);
   --  Movil.Mostrar;
   --
   --  --Para Varios Vehiculos
   --  Reset(Semilla);
   --  --Inicializo un vector de 4 vehiculos
   --  for I in 1..4 loop
   --     Movil := new Vehiculo;
   --     Movil.PosicionX := 0.0;
   --     Movil.VelocidadX := KilometrosPorHora(Float(Random(Semilla)) * 100.0);
   --     Moviles.Append(Movil);
   --  end loop;
   --
   --  for Vehiculo of Moviles loop
   --     Vehiculo.Mostrar;
   --     Put_Line("Despues de media Hora...");
   --     Vehiculo.Actualizar(1800);
   --     Vehiculo.Mostrar;
   --  end loop;

   --Ejemplo del porque del encapsulamiento
   --  Movil := new Vehiculo;
   --  Movil.PosicionX := 0.0;
   --  Movil.VelocidadX := 10.0;
   --  Movil.Mostrar;
   --  Put_Line("Despues de media hora...");
   --  Movil.Actualizar(1800);
   --  Movil.PosicionX := 1000.0; --No tiene mucho sentido actualizar si despues puedo modificar la posicion a mano
   --  Movil.Mostrar;

   --Ejemplo Con Encapsulamiento
   Movil := new Vehiculo;
   Movil.Init;   --Inicializo
   Movil.Set_Velocidad_X(20.0); --Setter
   Movil.Mostrar;
   Put_Line("Media hora despues...");
   Movil.Actualizar(1800);
   Movil.Mostrar;

end Main;
