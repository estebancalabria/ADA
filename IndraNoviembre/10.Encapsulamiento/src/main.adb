with Ada.Text_IO; use Ada.Text_IO;
with Persona_Model; use Persona_Model;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   --Iñigo : Persona := new C_Persona'(Nombre => To_Unbounded_String("Iñigo"));
   --Iñigo : Persona := Create("Iñigo", "Montero");
   Millon_De_Euros : constant Dinero := 1000000.00;
   Iñigo : Persona := Create(Nombre => "Iñigo", Apellido => "Montero");
begin
   --Iñigo.Nombre := To_Unbounded_String("Juan"); --No esta tan bueno
   Iñigo.Saludar;
   Iñigo.Set_Riqueza(1000001.00);
   Put_Line(if Iñigo.Get_Riqueza > Millon_De_Euros then "Millonario" else "Pobre");
end Main;
