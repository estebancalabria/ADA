with Ada.Text_IO; use Ada.Text_IO;

package body juego is

   function Crear (Nombre : String) return Jugador is
      Personaje : Jugador;
   begin
      Personaje.Nombre := new String'(Nombre);
      Personaje.Hp := 1000;
      Personaje.Hp_MAX := 1000;
      Personaje.Str := 100;
      Personaje.Class := Guerrero;
      return Personaje;
   end;
   
   procedure Set_Clase (This : in out Jugador; Valor:Clase) is
   begin
      This.Class := Valor;
   end;
   
   procedure Set_Fuerza (This : in out Jugador; Valor:Fuerza) is 
   begin
      This.Str := Valor;
   end;
   
   procedure Set_Hp (This : in out Jugador; Valor:Vida) is 
   begin
      if (Valor<=This.Hp_MAX) then         
         This.Hp := Valor;
      end if;      
   end;
     
   procedure Mostrar (This : in Jugador) is 
   begin
      Put_Line("Nombre: " & This.Nombre.all);
      Put_Line("HP: " & This.Hp'Image & "/" & This.Hp_Max'Image);
      Put_Line("Fuerza: " & This.Str'Image);
      Put_Line("Nivel: " & This.Lvl'Image); 
      Put_Line("Clase: " & This.Class'Image);   
   end;
   

end juego;
