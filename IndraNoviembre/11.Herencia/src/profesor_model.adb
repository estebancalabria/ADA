package body Profesor_Model is

   function Create(Nombre:String) return Profesor is
      Result : Profesor := new C_Profesor;
   begin
      --return new C_Profesor'(C_Persona with Nombre => To_Unbounded_String(Nombre), 
      --                       Num_Cursos => 0);
      Result.Nombre := To_Unbounded_String(Nombre);
      Result.Num_Cursos := 0;
      return Result;
   end Create;
   
   function To_String(This: in C_Profesor) return String is
   begin
      return ("Hola, soy el profesor " & To_String(This.Nombre));
   end To_String;
   
   procedure Dictar_Curso(This: in out C_Profesor) is
   begin
       This.Num_Cursos := This.Num_Cursos + 1;
   end Dictar_Curso;
   
end Profesor_Model;
