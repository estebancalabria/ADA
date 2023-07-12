with Need_For_Speed; use Need_For_Speed;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Utils; use Utils;

procedure Main is

   A : Automovil := Crear;
   C : Contador;
begin
   --  A.Acelerar(100.0);
   --  A.Frenar(10.0);
   --  --Acelerar(A, 100.0);
   --  --Frenar(A, 10.0);
   --  --Actualizar_Distancia_Recorrida(A, 0.5);
   --  Put(Float(A.Get_Distancia_Recorrida), Exp => 0, Aft => 2);
   --Put_Line(" Km recorridos");
   -- New_Line;
   --  Insert code here.
   C.Inc;
   Inc(C);
   C.Inc;
   C.Inc;
   Put_Line(C.Valor'Image);
   null;
end Main;
