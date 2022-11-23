with Ada.Text_IO; use Ada.Text_IO; 
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Transporte is
   
   procedure Init(This: in out Vehiculo) is --Constructor
   begin
      This.VelocidadX := 0;
      This.PosicionX := 0;
   end;
   
   
   procedure Set_Velocidad_X(This: in out Vehiculo; Velocidad:KilometrosPorHora) is --Setter
   begin
      this.VelocidadX := Velocidad;
   end;
   
     
   
   procedure Mostrar(This:Vehiculo) is
   begin
      Put("Soy un vehiculo desplazandome a "); 
      Put(Float(This.VelocidadX),0,2,0); 
      Put(" km/h y he recorrido ");
      Put(Float(This.PosicionX),0,2,0);
      Put(" metros");
      Put_Line("");
   end;
   
   procedure Actualizar(This:in out Vehiculo; Tiempo:Segundos) is
   begin
      This.PosicionX := This.PosicionX 
        + Metros(Integer(Float(This.VelocidadX) * 1000.0 / 3600.0  * Float(Tiempo)));
   end;
   

end Transporte;
