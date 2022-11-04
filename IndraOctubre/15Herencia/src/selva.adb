package body Selva is

   -- Quito el constructor porque animal es abstracta
   --  function Create(Un_Nombre : String) return Animal is
   --    Result : Animal := new Clase_Animal;
   --  begin
   --     Result.Nombre := To_Unbounded_String(Un_Nombre);
   --     return Result;
   --  end Create;
   
   function Get_Nombre(This: in Clase_Animal) return String is
   begin
      return To_String(This.Nombre);
   end;

   
   function Create_Leon(Un_Nombre : String) return Animal is
     Result : Animal := new Clase_Leon;
   begin
      Result.Nombre := To_Unbounded_String(Un_Nombre);
      return Result;
   end Create_Leon;
   
   overriding procedure Hablar(This: in Clase_Leon) is
   begin
      Put_Line("Rooooooooooooooaaaaaaaaaaaaaaaaaarrrrrrrrrrrr");
   end Hablar;
   

   function Create_Jirafa(Un_Nombre : String) return Animal is
     Result : Animal := new Clase_Jirafa;
   begin
      Result.Nombre := To_Unbounded_String(Un_Nombre);
      return Result;
   end Create_Jirafa;
   
   overriding procedure Hablar(This: in Clase_Jirafa) is
   begin
      Put_Line("Soy una jirafa y no emito sonido");
   end Hablar;
   

   function Create_Aguila(Un_Nombre : String) return Animal is   
      Result : Animal := new Clase_Aguila;   
   begin      
      Result.Nombre := To_Unbounded_String(Un_Nombre);      
      return Result;   
   end;
 
   overriding procedure Hablar(this: in Clase_Aguila) is    
   begin      
      Put_Line("HUHUHUHUHUHHHUHUHU");   
   end;

end Selva;
