with Ada.Text_IO;
with Ada.Float_Text_IO;
with Figuras; use Figuras;

procedure Main is
   use Ada.Text_IO;
   use Ada.Float_Text_IO;
   Cuadrado : access Rectangulo;
   Piramide : access Triangulo;
   Circuloo : access Circulo;

   --Quiero una variable que pueda apuntar a un Circulo, Triangulo o un Rectualo
   PunteroEspecial : access Figura'Class;
begin
   --  Insert code here.
   Cuadrado := new Rectangulo ;
   --Cuadrado.X := 10;
   --Cuadrado.Y := 5;
   Cuadrado.LadoA := 10.0;
   Cuadrado.LadoB := 10.0;
   Put_Line("El Area del cuadrado es ");
   Put(Float(Cuadrado.CalcularArea),1,2,0);
   Cuadrado.Dibujar;

   Put_Line("");

   Piramide := new Triangulo;
   Piramide.X := 9;
   Piramide.Y := 5;
   Piramide.Base := 14.0;
   Piramide.Altura := 2.0;
   Put_Line("El Area del triangulo es ");
   Put(Float(Piramide.CalcularArea),1,2,0);
   Piramide.Dibujar;

   Put_Line("");

   Circuloo := new Circulo'(X     => 10,
                            Y     => 5,
                            Radio => 14.0);
   --Circuloo.X := 10;
   --Circuloo.Y := 5;
   --Circuloo.Radio := 14.0;
   Put_Line("El Area del circulo es: ");
   Put(Float(Circuloo.CalcularArea),1,2,0);
   Circuloo.Dibujar;

   PunteroEspecial := Circuloo;
   PunteroEspecial.Dibujar;
   PunteroEspecial := Piramide;
   PunteroEspecial.Dibujar;

   --Free(Cuadrado);
end Main;
