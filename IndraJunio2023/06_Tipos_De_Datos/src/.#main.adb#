with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

begin

   --Subtipos
   declare
      type Frutas is new Integer;
      subtype Peras is Frutas;
      subtype Manzanas is Frutas;

      type Dias_Mes is range 1..31;
      subtype Dias_Febrero is Dias_Mes range 1..28;


      subtype Mayores_Que_100 is Integer range 100..Integer'Last;

      P : Peras := 1;
      M : Manzanas := 2;
      F : Frutas;

      I : Integer := 12;
      N : Natural :=0;  --subtipo de Integer
      Po : Positive := 1; --subtipo de Integer
      Mayor : Mayores_Que_100 := 156; --Compila pero da un CONSTRAINT_ERROR
   begin
      P := M; --No puedo mezclar peras con manzanas
      F := P + M;  --Ahora puedo sumar peras y manzanas

      --Po := N; --Me tira un error porque a un positivo le asigno un 0

      --I := M;
     -- M := I;
   exception
       when Constraint_Error => Put_Line("Algun subtipo se me fue de rango");
   end;

   --Tipos Discretos. Definir tipos por rango
   declare
      --Tipos Entero
      type Nota is range 0..10;
      type Cuatro_Bit is range -(2**4)..+(2**4); --** operador de exponente
      --type Nota is new Integer range 0..10;

      --Tipos Modulares o Enteros sin Signo (No Tiene Overflow)
      type Ancho_Pantalla is mod 80;
      --type Ancho_Pantalla is range 0..80; parecido, pero aca da Constraint Error

      --Tipos Enumerados
      type Dias_Semana is (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo);
      subtype Dias_Laborales is Dias_Semana range Lunes..Viernes;
      subtype Dias_Finde is Dias_Semana range Sabado..Domingo;

      --Examen : Nota;
      --Variable: Cuatro_Bit;
      --I : Integer;
      --Posicion : Ancho_Pantalla;

      Dia : Dias_Semana;
   begin
      --Put_Line(Cuatro_Bit'First'Image);
      --Put_Line(Cuatro_Bit'Last'Image);
      --Put_Line(Cuatro_Bit'Size'Image);
      --Put_Line(Variable'Size'Image);

      --Posicion := 60;
      --Put_Line(Posicion'Image);
      --Posicion := Posicion + 60;
      --Put_Line(Posicion'Image);

      Dia := Lunes;
      Put_Line(Dia'Image); --El image lo muestra en mayuscula

      --Prueba para convertir un string en un enumerado
      --declare
      --   S:String := Get_Line;
      --Begin
      --   Dia := Dias_Semana'Value(S);
      --   Put_Line(Dia'Image); --El image lo muestra en mayuscula
                           --I := Integer(Dia); --No se puede casteaar un Integer a un Dia
      --end;

      --Examen := 10;
      --I := Examen; --Incompatible
   end;

   --Tipos Flotantes
   declare
      type Entre_1_y_0 is new Float range 0.0..1.0;

      --Cantidad de Digitos
      type Cuatro_Digitos is digits 4; --Digitos despues de la coma
      type Cinco_Digitos is digits 5;
      type Muchos_Digitos is digits 18;

      --Cantidad de Digitos y espacio entre dos numeros
      type Numero_Flotante is delta 0.01 digits 3; --Ditiros en total

      type T3_D3 is delta 0.001 digits 3;
      --Va de -0.999 a 0.999
      type T3_D6 is delta 0.001 digits 6;
      --Va de -999.999 a 999.999
      type T2_D3 is delta 0.01 digits 3;
      --Va de -9.99 a 9.99


      --F : Float := 1.0;
      N : Entre_1_y_0 := 0.2;
      D4: Cuatro_Digitos := 12.3456;
      D5: Cinco_Digitos := 12.3456;
      Muchos : Muchos_Digitos := 12.3456;

      NF : Numero_Flotante;
   begin
      --Put_Line(F'Size'Image);
      --Put_Line(N'Size'Image);
      --Put_Line(D5'Size'Image);

      --Put_Line(D4'Image);
      --Put_Line(D5'Image);
      --Put_Line(Muchos'Image);

      --Put_Line(D4'Size'Image);
      --Put_Line(D5'Size'Image);
      --Put_Line(Muchos'Size'Image);

      NF := 1.0;
      Put_Line(NF'Image);
      NF := NF + 0.01;
      Put_Line(NF'Image);
      NF := NF + 1.001; --Este numero no tiene representacion
      Put_Line(NF'Image);

   end;




end Main;

