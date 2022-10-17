with ada.Numerics.Float_Random, ada.Float_Text_IO, ada.Integer_Text_IO, ada.Text_IO;
use ada.Numerics.Float_Random, ada.Float_Text_IO, ada.Integer_Text_IO, ada.Text_IO;

procedure Main is
   G: Generator;
   Numero_Al_Azar : Integer;
   Entrada : Integer;
   Victoria : Boolean := false;
   Oportunidad_Actual : Integer := 1;
   Max_Oportunidades:constant Integer := 5;
begin
   --La computadora determina un numero al azar entre 1 y 100
   --La computadora da 5 oportunidades al usuario para adivinar dicho numero
   --El usuario arriesga un numero y la computadora dice si dicho numero es mayor o menor al numero secreto
   --Si adivino antes de las 5 oportunidades gana
   --Si no logra adivinar pierde
   Reset(G);
   Put_Line("Juego de Advinar el numero");
   Numero_Al_Azar := Integer(  ( Random(G) * 99.0) + 1.0);
   loop
      Put_Line("Adivine el nunero secreto");
      Get(Entrada);
      Victoria := Entrada=Numero_Al_Azar;
      exit when Victoria;

      Put_Line("El numero ingresado es " &
               (if (Entrada>Numero_Al_Azar) then "mayor" else "menor")
               & " al numero secreto");

      Oportunidad_Actual := Oportunidad_Actual + 1;
      exit when (Oportunidad_Actual>Max_Oportunidades);
   end loop;

   Put_Line(if Victoria then "Ganaste" else "Perdiste");
   Put_Line("El numero era :" & Numero_Al_Azar'Image);

end Main;
