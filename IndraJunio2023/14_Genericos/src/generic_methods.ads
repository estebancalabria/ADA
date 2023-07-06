package Generic_Methods is

   generic
      --type T is private; --Tipos No Limitados, Definidos (Longitud Fija)
      type T(<>) is private; --Tipos No Limitados, Tambien Indefinidos (Longitud Vairiable)
      --type T is (<>); --Solo tipos discreto
      --type T is range <>; --Solo enteros discretos escalares
   procedure Generic_Swap(A : in out T; B : in out T);

end Generic_Methods;
