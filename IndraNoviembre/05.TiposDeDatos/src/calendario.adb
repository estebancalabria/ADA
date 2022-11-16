with Ada.Text_IO; use Ada.Text_IO;

package body Calendario is

   procedure Mostrar_Dias is
   begin
      for Dia in Dias_Semana loop
         case Dia is
         when Sabado..Domingo =>
            Put_Line(Dia'Image & " es fin de semana");
         when Lunes..Viernes =>
            Put_Line(Dia'Image & " es dia de semana");
         end case;
      end loop;     
   end Mostrar_Dias;
   
   procedure Mostrar_Meses is
   begin
      for Mes in Meses loop     
         Put_Line ("Estamos en el Mes: " & Mes'Image);
         case Mes is
         when Marzo..Mayo =>     
            Put_Line ("Estas en " & Primavera'Image);
         when Junio .. Agosto =>
            Put_Line ("Estas en " & Verano'Image);
         when Septiembre .. Noviembre =>
            Put_Line ("Estas en " & Otoño'Image);
         when others =>
            Put_Line ("Estas en " & Invierno'Image);
         end case;
      end loop;
   end Mostrar_Meses;
   
   function To_String(Date:Fecha) return String is
   begin
      return Date.Dia'Image & "/" & Date.Mes'Image & "/" & Date.Año'Image;
   end;
   

end Calendario;
