package body Need_For_Speed is

   function Crear return Automovil is
      A:Automovil;
   begin
      A.Velocidad_Actual := 0.0;
      A.Velocidad_Maxima := 300.0;
      A.Distancia_Recorrida := 0.0;
      return A;
   end;
   
   procedure Acelerar(This: in out Automovil; Incremento : Kilometros_Por_Hora) is
   begin
      if ((This.Velocidad_Actual + Incremento)<this.Velocidad_Maxima) then
         This.Velocidad_Actual := This.Velocidad_Actual + Incremento;
      else
         This.Velocidad_Actual := This.Velocidad_Maxima;
      end if;      
   end;
   
        
   procedure Frenar(This: in out Automovil; Decremento:Kilometros_Por_Hora) is
   begin
      if ((This.Velocidad_Actual - Decremento)>0.0) then
         This.Velocidad_Actual := This.Velocidad_Actual - Decremento;
      else
         This.Velocidad_Actual := 0.0;
      end if;
   end;
   
   procedure Actualizar_Distancia_Recorrida(This: in out Automovil; Tiempo:Horas) is
   begin
      This.Distancia_Recorrida := Kilometos(This.Velocidad_Actual) * Kilometos(Tiempo);
   end;
   
   function Get_Distancia_Recorrida(This: in out Automovil) return Kilometos is 
   begin
      return This.Distancia_Recorrida;
   end;
   

end Need_For_Speed;
