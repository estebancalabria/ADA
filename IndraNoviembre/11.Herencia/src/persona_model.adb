package body Persona_Model is

   function Get_Nombre(This:in C_Persona) return String is
   begin
      return To_String(This.Nombre);
   end Get_Nombre;
   
   procedure Set_Nombre(This:out C_Persona; Value:String) is
   begin
      This.Nombre := To_Unbounded_String(Value);
   end;
        
end Persona_Model;
