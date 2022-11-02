with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Personaje; use Personaje;

procedure Main is
   Khazix : Campeon;
begin
   --Khazix := new Clase_Campeon;
   --Khazix.Nombre := To_Unbounded_String("Khazix");
   Khazix := Create("Khazix");
   --Khazix.Nivel := 5; --Estaria mal, no respeta el encapsulamiento
   --Khazix.Experiencia := 2000; --Estaria mal, no respeta el encapsulamiento
   Put_Line(Khazix.To_String);
   Put_Line("Probando los Getters");
   Put_Line("Nombre : " & Khazix.Get_Nombre);
   Put_Line("Nivel : " & Khazix.Get_Nivel'Image);


   null;
end Main;
