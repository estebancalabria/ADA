package Q_Generic_Utils is

   generic
      Type T is private; --Non-Limited (Anda, :=, =, (<>) inicializacion)
      --Type T(<>) is private; --Asi funciona para los Strings porque los Strins requieren inicializacion
   procedure P_Generic_Swap (V_Param_1: in out T; V_Param_2: in out T);

   --TODO MAS ADELANTE
   generic
      Type T_Must_Initialize(<>) is private; --Asi funciona para los Strings porque los Strins requieren inicializacion
   procedure P_Generic_Non_Definitive_Swap 
     (V_Param_1: in out T_Must_Initialize; 
      V_Param_2: in out T_Must_Initialize);
   

end Q_Generic_Utils;
