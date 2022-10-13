with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package body Juego is

   procedure Init (This: in out TPersonaje; Nombre : String) is   
   begin      
      This.Nombre := To_Unbounded_String(Nombre);   
   end;
   
   procedure Init(This:in out THeroe; Nombre:String) is
   begin
      TPersonaje(This).Init(Nombre); --LLamo al init de la clase padre
      This.Experiencia := 0;
      This.Nivel := 1;
      This.Posicion.Posicion_X := 0;
      This.Posicion.Posicion_Y := 0;
   end;
   
   procedure Mostrar (This: THeroe) is   
   begin      
      Put_Line("Soy el heroe" & To_String(This.Nombre) & 
               " de nivel " & This.Nivel'Image & 
               " (" & This. Experiencia'Image &" XP) y estoy en (" &  
               This.Posicion.Posicion_X'Image & " ," & 
               This.Posicion.Posicion_Y'Image & " )");   
   end; 
   
   procedure Init (This: in out TEnemigo; Nombre:String) is   
      Semilla : Generator;
   begin      
      TPersonaje(This).Init(Nombre);
      This.Esta_Vivo := True;
      This.Experiencia_Otorgada := 100; 
      
      Reset(Semilla);   
      This.Posicion.Posicion_X := TPosX(Random(Semilla) * 100.0);   
      This.Posicion.Posicion_Y := TPosY(Random(Semilla) * 100.0);
   end Init;
   
   procedure Mostrar (This: TEnemigo) is   
   begin      
      if This.Esta_Vivo then
         Put_Line("Soy el enemigo " & To_String(This.Nombre) &  
                    " ( " & 
                     This.Posicion.Posicion_X'Image & " ," & 
                     This.Posicion.Posicion_Y'Image & " )" &   
                    " y estoy vivo");
      else              
         Put_Line("Soy el enemigo " & To_String(This.Nombre) &  
                   " y estoy muerto");        
      end if;      
   end; 
   
   procedure Mover (This:in out TPersonaje; Direccion :TDireccion) is  
   begin
      if ((Direccion = Norte) AND (This.Posicion.Posicion_Y > TPosY'First)) then         
         This.Posicion.Posicion_Y := This.Posicion.Posicion_Y-1;      
      elsif((Direccion = Sur) AND (This.Posicion.Posicion_Y < TPosY'Last )) then
         This.Posicion.Posicion_Y := This.Posicion.Posicion_Y+1;      
      elsif((Direccion = Este)AND(This.Posicion.Posicion_X<TPosX'Last)) then         
         This.Posicion.Posicion_X := This.Posicion.Posicion_X+1;      
      elsif((Direccion = Oeste)AND(This.Posicion.Posicion_X>TPosX'First)) then
         This.Posicion.Posicion_X := This.Posicion.Posicion_X-1;      
      end if;   
   end Mover;
   
   procedure Atacar(This:in out THeroe; Enemigo: TEnemigo) is
   Begin
      if ((abs Integer(This.Posicion.Posicion_X)-Integer(Enemigo.Posicion.Posicion_X))<2) 
        and ((abs Integer(This.Posicion.Posicion_Y)-Integer(Enemigo.Posicion.Posicion_Y))<2) then
         Begin
            --Enemigo.Esta_Vivo := False;
            This.Experiencia := This.Experiencia + Enemigo.Experiencia_Otorgada;
         end;
   end;
   
end Juego;
