with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Characters.Handling;

package body Q_Fecha is

   procedure P_Mostrar_Fecha_Actual is
   begin
      declare
      
         type T_Mes is (E_Enero, E_Febrero, E_Marzo, E_Abril,
                        E_Mayo, E_Junio, E_Julio, E_Agosto,
                        E_Septienbre, E_Octubre, E_Noviembre,
                        E_Diciembre);
         
         type T_Dia is new Integer range 1..31;
         type T_Año is new Integer range 1900..3000;
         
         type T_Fecha is record
            R_Dia : T_Dia;
            R_Mes : T_Mes;
            R_Año : T_Año;
         end record;
         
         --  function "&"(V_Cadena:String; V_Mes: T_Mes) return String is
         --  begin
         --     return V_Cadena & (Case V_Mes is
         --                         when E_Enero => "Enero",
         --                         when E_Febrero => "Febrero",
         --                         when E_Marzo => "Marzo",
         --                         when E_Abril => "Abril",
         --                         when E_Mayo => "Mayo",
         --                         when E_Junio => "Junio",
         --                         when E_Julio => "Julio",
         --                         when E_Agosto => "Agosto",
         --                         when E_Septienbre => "Septiembre",
         --                         when E_Octubre => "Ocubre",
         --                         when E_Noviembre => "Noviembre",
         --                         when E_Diciembre => "Diciembre");
         --  end;
         
         --function "&"(V_Cadena:String; V_Mes: T_Mes) return String is
         --   use Ada.Characters.Handling;        
         --begin       
         --   return V_Cadena
         --     & To_Lower(V_Mes'Image(3..V_Mes'Image'Length));
         --end;
         
         function "&"(V_Cadena:String; V_Mes: T_Mes) return String is
            
            function "+"(Input:String) return Unbounded_String renames To_Unbounded_String;
            
            C_Meses : constant array (T_Mes) of Unbounded_String := 
              (+"Enero",+"Febrero",+"Marzo",+"Abril",
               +"Mayo",+"Junio",+"Julio",+"Agosto",
               +"Septiembre",+"Octubre",+"Noviebre",+"Diciembre");
         begin
            return To_String(C_Meses(V_Mes));
         end;
         
          
         
         
         function "&"(V_Cadena:String; V_Fecha : T_Fecha) return String is
         begin
            return V_Cadena
              & V_Fecha.R_Dia'Image & " de " 
              & V_Fecha.R_Mes & " de" 
              & V_Fecha.R_Año'Image;
         end;
         
         V_Fecha_Actual : T_Fecha;
      begin
         --Inicializacion : Forma 1
         V_Fecha_Actual.R_Dia := 24;
         V_Fecha_Actual.R_Mes := E_Octubre;
         V_Fecha_Actual.R_Año := 2023;
         
         --Incializacion : Forma 2 : Aggregate Posicional
         V_Fecha_Actual := (20, E_Octubre, 2023);
         
         --Incializacion : Forma 2 : Aggregate con Nombre
         V_Fecha_Actual := ( R_Dia => 24,
                             R_Mes => E_Octubre,
                             R_Año => 2023);
         
         Put_Line("Hoy es" & V_Fecha_Actual); --Todo gracias a que escribimos el concatenacion
      end;
   end;
end Q_Fecha;
