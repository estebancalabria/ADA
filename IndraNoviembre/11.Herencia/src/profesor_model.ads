with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Persona_Model; use Persona_Model;

package Profesor_Model is

   type Cantidad_Cursos_Dictado is new Integer;
   
   type C_Profesor is new C_Persona with private;
   type Profesor is access C_Profesor'Class;
   
   function Create(Nombre:String) return Profesor;
   overriding function To_String(This: in C_Profesor) return String;   
   procedure Dictar_Curso(This: in out C_Profesor);

private   
   
   type C_Profesor is new C_Persona with record      
      --Nombre : Unbounded_String;      
      Num_Cursos : Cantidad_Cursos_Dictado := 0;
   end record; 

end Profesor_Model;
