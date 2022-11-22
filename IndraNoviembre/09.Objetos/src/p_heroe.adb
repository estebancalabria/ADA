package body P_Heroe is

   procedure Presentar(This:C_Heroe) is
   begin
      Put_Line("Me presento, soy "
               & To_String(This.Nombre)
               & ", tengo"
               & This.Fuerza'Image
               & " puntos de fuerza y"
               & This.Puntos_De_Vida'Image
               & " puntos de vida");
   end;

end P_Heroe;
