with Ada.Text_IO; use Ada.Text_IO;
with Persona_Model; use Persona_Model;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
   --I�igo : Persona := new C_Persona'(Nombre => To_Unbounded_String("I�igo"));
   --I�igo : Persona := Create("I�igo", "Montero");
   Millon_De_Euros : constant Dinero := 1000000.00;
   I�igo : Persona := Create(Nombre => "I�igo", Apellido => "Montero");
begin
   --I�igo.Nombre := To_Unbounded_String("Juan"); --No esta tan bueno
   I�igo.Saludar;
   I�igo.Set_Riqueza(1000001.00);
   Put_Line(if I�igo.Get_Riqueza > Millon_De_Euros then "Millonario" else "Pobre");
end Main;
