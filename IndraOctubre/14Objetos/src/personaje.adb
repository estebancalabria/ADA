package body Personaje is
   
   function Create(Nombre:String) return Campeon is
      Result : Campeon;
   begin
      Result := new Clase_Campeon;
      
      Result.Nombre := To_Unbounded_String(Nombre);
      Result.Nivel := 1;
      Result.Experiencia := 0;
      
      return Result;
   end;
   

   function To_String(This:Clase_Campeon) return String is
   begin
      return "Soy el campeon " 
        & To_String(This.Nombre)
        & "(HP:" & This.Hp'Image & ","
        & "Nivel:" & This.Nivel'Image & ")";
   end;
   


end Personaje;
