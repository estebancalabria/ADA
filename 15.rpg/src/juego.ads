with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Juego is
   type TDireccion is (Norte, Sur, Este, Oeste);
   type TExperiencia is new Natural;
   type TNivel is range 1..20;
   type TPosX is range 0..100;   
   type TPosY is range 0..100;  
   
   
   type TPosicion is tagged 
      record      
         Posicion_X : TPosX;      
         Posicion_Y : TPosY;   
      end record;

   type TPersonaje is abstract tagged private;
   type PPersonaje is access TPersonaje'Class;   
   
   procedure Init(This: in out TPersonaje; Nombre:String);
   procedure Mover (This: in out TPersonaje; Direccion :TDireccion);
   procedure Mostrar(This:TPersonaje) is abstract;
   
   type THeroe is new TPersonaje with private;
   procedure Init(This:in out THeroe; Nombre:String);
   overriding procedure Mostrar(This:THeroe);
                    
   type TEnemigo is new TPersonaje with private;    
   procedure Init(This: in out TEnemigo; Nombre:String); 
   overriding procedure Mostrar (This: TEnemigo);
private
   
   type TPersonaje is abstract tagged 
      record
         Nombre : Unbounded_String;     
         Posicion : TPosicion;   
      end record;  
   
   type THeroe is new TPersonaje with      
      record         
         Experiencia : TExperiencia;
         Nivel : TNivel;      
      end record;
  
   type TEnemigo is new TPersonaje with      
      record         
         Experiencia_Otorgada:TExperiencia;          
         Esta_Vivo : Boolean;       
      end record;  
end Juego;
