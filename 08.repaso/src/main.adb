with Ada.Text_IO; use Ada.Text_IO;
with  Util_Discrete_Generics; use Util_Discrete_Generics;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Calculadora;
with Persona;

procedure Main is

   --  A:Integer;
   --  B:Integer;
   --  procedure SwapInteger is new Swap (T => Integer);
begin
   --  A:=10;
   --  B:=20;
   --  Put_Line(A'Image);
   --  Put_Line(B'Image);
   --  SwapInteger(A,B);
   --  Put_Line(A'Image);
   --  Put_Line(B'Image);
   --
   --  --Ejemplo 2: Crear un tipo nuevo y utilizar la funcion generica Add
   --  declare
   --     type RG is range 1..20; --range <>
   --     --type RG is new digits range 1.0..20.0;
   --     function AddInt is new Add(TT=>RG);
   --     RES : RG;
   --  begin
   --     Res := AddInt(2,2);
   --     Put_Line(Res'Image);
   --  end;
   --
   --  --Ejemplo 3 : Paquetes genericos
   --  declare
   --     type Rango is Range -10..1000;
   --     package Calc is new Calculadora(T =>  Rango);
   --     Res : Rango;
   --  Begin
   --     Res := Calc.Sumar(2,2);
   --     Put_Line("2 + 2 =" & Res'Image);
   --     Res := Calc.Restar(4,2);
   --     Put_Line("4 + 2 =" & Res'Image);
   --     Res := Calc.Multiplicar(3,4);
   --     Put_Line("3 * 4 =" & Res'Image);
   --     Res := Calc.Dividir(5,2);
   --     Put_Line("(division Entera) 5 / 2 =" & Res'Image);
   --     Put_Line("Ultimo Valor:" & Calc.Get_Ultimo_Valor'Image);
   --     Put_Line("Ante Ultimo Valor:" & Calc.Get_AnteUltimo_Valor'Image);
   --  end;

   --  --Ejempo 4 : Manejo de punteros en ADA
   --  declare
   --     A : Integer;
   --     B : Integer;
   --     PA : access Integer;
   --     PB : access Integer;
   --  begin
   --     --Sin Punteros
   --     A := 10;
   --     B := A;
   --     Put_Line(A'Image);
   --     Put_Line(B'Image);
   --     Put_Line("Modifico A");
   --     A := 20;
   --     Put_Line(A'Image);
   --     Put_Line(B'Image);
   --
   --     Put_Line("Ahora con Punteros...");
   --     PA := new Integer; --Reservando memoria en el heap
   --     PB := PA; --Las dos variables apuntan al mismo lugar en el heap
   --     PA.all := 10; --Para modificar el valor dentro del heap uso el .all
   --     Put_Line("PA = " & PA.all'Image);
   --     Put_Line("PB = " & PB.all'Image);
   --     PB.all := 30;
   --     Put_Line("PA = " & PA.all'Image);
   --     Put_Line("PB = " & PB.all'Image);
   --  end;

   ---Ejemplo 5 : Objetos con access
   declare
      use Persona;
      Juan : TPersona;
      Pedro : access TPersona;
   begin
      Juan.Nombre := To_Unbounded_String("Juan");
      Juan.Edad := 20;
      Juan.Mostrar;
      Juan.FestejarCumple;
      Juan.Mostrar;

      Pedro := new TPersona;
      Pedro.Edad := 40;
      Pedro.Mostrar;
      Pedro.FestejarCumple;
      Pedro.Mostrar;
   end;


end Main;
