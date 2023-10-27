package body Q_Generic_Utils is

   procedure P_Generic_Swap (V_Param_1: in out T; V_Param_2: in out T) is
      V_Aux : T := V_Param_1;
   begin
      V_Param_1 := V_Param_2;
      V_Param_2 := V_Aux;
   end;
   
   --Despues lo mejoramos (Necesito explicar algo antes)
   procedure P_Generic_Non_Definitive_Swap 
     (V_Param_1: in out T_Must_Initialize; 
      V_Param_2: in out T_Must_Initialize) is
      
      V_Aux : T_Must_Initialize := V_Param_1;
   begin
      V_Param_1 := V_Param_2;
      V_Param_2 := V_Aux;
   end;
end Q_Generic_Utils;
