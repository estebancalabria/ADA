package body Aula is

   procedure Mostrar_Asistentes is
   begin
      for Asistente of Asistentes loop
         Mostrar_Integrante(Asistente);
      end loop;     
   end;
  
end Aula;
