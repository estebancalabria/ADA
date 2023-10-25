with Ada.Text_IO; use Ada.Text_IO;
with Consola; use Consola;

package body Q_Persona is

   procedure P_Ingresar_Y_Mostrar_Persona is
      V_Persona : T_Persona;
   begin
      --Version 1 : Sin records (Por ahora...)
      --  Put_Line("Ingrese su nombre ");
      --  declare
      --     V_Nombre : String := Consola.F_Get_Line_Not_Empty;
      --  begin
      --     Put_Line("Ingrese su apellido");
      --     declare
      --        V_Apellido : String := Consola.F_Get_Line_Not_Empty;
      --     begin
      --        Put_Line("Ingrese su edad");
      --        declare
      --           V_Edad : Positive := Consola.F_Get_Integer;
      --        begin
      --           Put_Line("Hola "
      --                    & V_Nombre
      --                    & " " & V_Apellido
      --                    & " de" & V_Edad'Image & " años");
      --        end;
      --     end;
      --end;
   
      --Put_Line("Ingrese su nombre");
      --V_Persona.R_Nombre := To_Unbounded_String(Consola.F_Get_Line_Not_Empty);
      --Put_Line("Ingrese su apellido");
      --V_Persona.R_Apellido := To_Unbounded_String(Consola.F_Get_Line_Not_Empty);
      --Put_Line("Ingrese su edad");
      ---V_Persona.R_Edad := Consola.F_Get_Integer;
      
      -- Put_Line("Hola "
      --          & To_String(V_Persona.R_Nombre)
      --         & " " & To_String(V_Persona.R_Apellido)
      --          & " de" & V_Persona.R_Edad'Image & " años")
      
      V_Persona.R_Nombre := Consola.F_Prompt("Ingrese su nombre");
      V_Persona.R_Apellido := Consola.F_Prompt("Ingrese su apellido");
      V_Persona.R_Edad := Consola.F_Prompt("Ingrese su edad");
      
      declare
         V_Nom : String renames To_String(V_Persona.R_Nombre);
         V_Ape : String renames To_String(V_Persona.R_Apellido);
         V_Eda : String  renames V_Persona.R_Edad'Image;
      begin 
         Put_Line("Hola " & V_Nom & " " & V_Ape & " de" & V_Eda & " años");
      end;

   end;
  
end Q_Persona;
