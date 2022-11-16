with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;
with Figuras;
with Calendario;

procedure Main is
begin

   --Ejemplo de las figuras
   --Declaracion de tipos
   --  declare
   --     use Figuras;
   --     A : Float := 1.3;
   --     B : Distancia := 5.6;
   --
   --     Base : Distancia := 10.0;
   --     Altura : Distancia := 15.0;
   --     Area_Triangulo : Area;
   --  begin
   --     --A := B; --Asignacion de tipos incompatibles
   --     --B := A; --Asignacion de tipos incompatibles
   --
   --     A := Float(B);  --Fuerzo la asignacion con un casteo
   --     B := Distancia(A); --Fuerzo la asignacion con un casteo
   --     Area_Triangulo := Calcular_Area_Triangulo(Base, Altura);
   --  end;

   --Ejepmplo tipos "constrained"
   --  declare
   --     --type Nota is new Integer range 1..10; --Tipo de dato restringido
   --     type Nota is range 1..10 with Default_Value => 5;
   --     --type Numero_Muy_Largo is range 1..2**56;
   --     --type Angulo is new Float range 0.0..360.0;
   --     type Angulo is mod 360;  --Los tipos de datos modular solo funcionan para enteros
   --
   --     Nota_Examen : Nota;
   --     --N :Numero_Muy_Largo;
   --     Giro : Angulo := 180;
   --  begin
   --     Nota_Examen := 10;
   --
   --     Put_Line(Nota_Examen'Size'Image);
   --     --Nota_Examen := Nota_Examen + 3; --Excepcion porque me fui de rango
   --     Put_Line(Nota_Examen'Image);
   --
   --     Put_Line(Giro'Image);
   --     Giro := Giro + 185;
   --     Put_Line(Giro'Image);
   --  end;

   -- Ejemplo Calendario y Enumerados
   --  declare
   --     use Calendario;
   --     --  type Dias_Semana is (Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo);
   --     --  type Meses is (Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Agosto, Septiembre, Octubre, Noviembre,Diciembre);
   --     --  type Estaciones is (Primavera, Verano, Otoño, Invierno);
   --
   --     --  Hoy_Es : Dias_Semana;
   --     --  Mañana_Es :Dias_Semana;
   --     Hoy : Fecha := (15, Noviembre, 2022);
   --     Cumple_Mario: Fecha := ( Dia => 1, Mes => Junio, Año => 1998); --Aggregate
   --  begin
   --     --  Hoy_Es := Martes;
   --     --  Put_Line(Hoy_Es'Image);
   --     --  Mañana_Es := Dias_Semana'Succ(Hoy_Es);
   --     --  Put_Line(Mañana_Es'Image);
   --     --  Mostrar_Dias;
   --     Put_Line("Hoy es " & To_String(Hoy));
   --     Put_Line("Mario cumple el " & To_String(Cumple_Mario));
   --  end;

   --Subtipos o Type alias o alias de tipos
   --  declare
   --     use Ada.Integer_Text_IO;
   --
   --     type Nota is new Integer range 1..10;
   --     subtype Notas_Buenas is Nota range 8..10;
   --     subtype Notas_Aprobadas is Nota range 4..7;
   --     subtype Notas_Malas is Nota range  1..3;
   --
   --     Examen : Nota := 10;
   --     --Mala_Nota : Notas_Malas;
   --  begin
   --     --Mala_Nota := Examen;  --Me deja asignarlo y hace el checkeo en tiempo de ejecucion
   --                              --Hace una conversion implicita como otros lenguajes
   --     --Ejemplo de uso de la practica
   --     Put_Line("Que nota te sacaste?");
   --     Get(Integer(Examen));
   --     case Examen is
   --        when Notas_Malas => Put_Line("Te sacaste una mala nota");
   --        when Notas_Buenas => Put_Line("Te sacaste una buena nota. Felicitaciones");
   --        when Notas_Aprobadas => Put_Line("Has Aprobado");
   --     end case;
   --  end;

   --subtipos para mayor legibilidad
   --Para hacer el codigo mas significativo, mas prolijo queda
   declare
      subtype Cantidad is Positive;

      A : Cantidad := 10;
      B : Positive := 40;
   begin
      B := A;
      Put_Line("Declaro un alias de tipo");
   end;




end Main;
