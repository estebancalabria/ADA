pragma Ada_2012;
package body Calculadora is

   -----------
   -- Sumar --
   -----------

   function Sumar (A, B : T) return T is
   begin
      AnteUltimoValor := UltimoValor;
      UltimoValor := A+B;
      return A+B;
   end;


   ------------
   -- Restar --
   ------------

   function Restar (A, B : T) return T is
   begin
      AnteUltimoValor := UltimoValor;
      UltimoValor := A-B;
      return A-B;
   end;


   -----------------
   -- Multiplicar --
   -----------------

   function Multiplicar (A, B : T) return T is
   begin
      AnteUltimoValor := UltimoValor;
      UltimoValor := A*B;
      return A*B;
   end;


   -------------
   -- Dividir --
   -------------

   function Dividir (A, B : T) return T is
   begin
      AnteUltimoValor := UltimoValor;
      UltimoValor := A/B;
      return A/B;
   end;

   function Get_Ultimo_Valor return T is
   begin
      return UltimoValor;
   end;

   function Get_AnteUltimo_Valor return T is
   begin
      return AnteUltimoValor;
   end;



end Calculadora;
