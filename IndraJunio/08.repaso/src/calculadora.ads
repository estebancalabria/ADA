generic
   type T is range<>;
   
package Calculadora is

   function Sumar(A,B:T) return T;
   function Restar(A,B:T) return T;
   function Multiplicar(A,B:T) return T;
   function Dividir(A,B:T) return T;
   
   function Get_Ultimo_Valor return T;
   function Get_AnteUltimo_Valor return T;

private
   
   UltimoValor : T := 0;
   AnteUltimoValor : T := 0;
   
end Calculadora;
