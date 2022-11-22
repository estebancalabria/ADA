with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with P_Persona; use P_Persona;
with P_Heroe; use P_Heroe;
with P_Triangulo; use P_Triangulo;

procedure Main is
begin
   declare
      Una_Persona : Persona := null;
      Un_Heroe : Heroe := null;
      Un_Triangulo : Triangulo := new C_Triangulo'(Base => 10.0, Altura => 10.0);
   begin

      Una_Persona := new C_Persona'(Nombre => To_Unbounded_String("Esteban"),
                                    Apellido => To_Unbounded_String("Calabria"));
      --Saludar(Una_Persona);
      Una_Persona.Saludar;

      Un_Heroe := new C_Heroe'(Nombre => To_Unbounded_String("Drax"),
                               Fuerza => 1000,
                               Puntos_De_Vida => 500);
      Un_Heroe.Presentar;

      Put_Line(Un_Triangulo.Calcular_Area'Image);

      --Quiero un clase Triangulo con base y altura de tipo float y un metodo calcular_area

   end;


   null;
end Main;
