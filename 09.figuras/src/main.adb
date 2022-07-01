with Ada.Text_IO;
with Ada.Float_Text_IO;
with Figuras; use Figuras;

procedure Main is
   use Ada.Text_IO;
   use Ada.Float_Text_IO;
   Cuadrado : access Rectangulo;
   Piramide : access Triangulo;
begin
   --  Insert code here.
   Cuadrado := new Rectangulo;
   Cuadrado.X := 10;
   Cuadrado.Y := 5;
   Cuadrado.LadoA := 10.0;
   Cuadrado.LadoB := 10.0;
   Put_Line("El Area del cuadrado es ");
   Put(Float(Cuadrado.CalcularArea),1,2,0);

   Put_Line("");

   Piramide := new Triangulo;
   Piramide.X := 9;
   Piramide.Y = 5;
   Piramide.Base := 14.0;
   Piramide.Altura := 2.0;
   Put_Line("El Area del triangulo es ");
   Put(Float(Piramide.CalcularArea),1,2,0);
   --Free(Cuadrado);
end Main;
