package Need_For_Speed is

   type Kilometros_Por_Hora is new Float range 0.0..300.0;
   --type Kilometros_Por_Hora is new Float;
   type Horas is new Float;
   type Kilometos is new Float;
   type Automovil is tagged private;
   
   function Crear return Automovil;
   procedure Acelerar(This: in out Automovil; Incremento : Kilometros_Por_Hora);
   procedure Frenar(This: in out Automovil; Decremento:Kilometros_Por_Hora);
   procedure Actualizar_Distancia_Recorrida(This: in out Automovil; Tiempo:Horas);
   function Get_Distancia_Recorrida(This: in out Automovil) return Kilometos;
   
private
   
   type Automovil is tagged record  --Class
      Velocidad_Actual : Kilometros_Por_Hora;
      Velocidad_Maxima : Kilometros_Por_Hora;
      Distancia_Recorrida : Kilometos;
   end record;
   

end Need_For_Speed;
