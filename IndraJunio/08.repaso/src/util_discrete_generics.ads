package Util_Discrete_Generics is

   generic type T is (<>);   
   procedure Swap(Left: in out T; Right: in out T); 
   
   --Agregar la funcion Add generica
   generic type TT is range <>;   function Add (A, B: TT) return TT;
   
end  Util_Discrete_Generics;

--<> --> Float ((y subrango), Integer (y Subrangos), Enumerados
