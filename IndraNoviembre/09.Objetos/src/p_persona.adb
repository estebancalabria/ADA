package body P_Persona is

   procedure Saludar(This: C_Persona) is      
   begin      
      Put_Line("Hola Soy "                 
               & To_String(This.Nombre)                 
               & " "                 
               & To_String(This.Apellido));      
   end Saludar;
   
      

end P_Persona;
