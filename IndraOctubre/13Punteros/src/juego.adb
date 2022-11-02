package body Juego is

   function To_String(Value:in Jugador) return String is
   begin
      return To_String(Value.Profesion) & " " & 
        To_String(Value.Nombre) & 
        "(HP :" & Value.Hp'Image & 
        ",Nivel:" & Value.Nivel'Image & ")";
   end;
   
   function To_String(Value: in Profesiones) return String is
   begin
      return To_Upper(Value'Image(1..1)) 
        & To_Lower(Value'Image(2..Value'Image'Length));
   end;
end Juego;
