with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;


package P_Heroe is

   --Sacar el heroe a un paquete aparte y agregarle el metodo presentar()
   
   type C_Heroe is tagged record   
      Nombre : Unbounded_String;
      Fuerza: Integer;
      Puntos_De_Vida : Integer;
   end record;
   
   type Heroe is access C_Heroe'Class;
   
   procedure Presentar(This: C_Heroe);

end P_Heroe;
