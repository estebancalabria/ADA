package body Generic_Methods is

   procedure Generic_Swap(A : in out T; B : in out T) is
      Lag : T := B;
      --Aux : T; --Esta linea no es valida porque t es de longingud variable/indefinido. Como no te deja S : String;
   begin
      B := A;
      A := Lag;
   end Generic_Swap;

end Generic_Methods;
