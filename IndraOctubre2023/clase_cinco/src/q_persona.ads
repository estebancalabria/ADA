with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Q_Persona is

   type T_Persona is record
      --V_Nombre : String; --No se puede
      R_Nombre : Unbounded_String;
      --V_Apellido : String;
      R_Apellido : Unbounded_String;
      R_Edad : Positive;
   end record;
   
   procedure P_Ingresar_Y_Mostrar_Persona;

end Q_Persona;
