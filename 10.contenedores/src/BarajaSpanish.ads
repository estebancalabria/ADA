package BarajaSpanish is

   type Count_Cartas is range 1..48;
   type Palo_Carta is (Bastos, Espadas, Oros, Copas);
   type Numero_Carta is range 1..12;
   
   type Carta is tagged 
      record
         Palo : Palo_Carta;
         Numero : Numero_Carta;
      end record;
   
   type PCarta is access Carta;
   
   procedure Mostrar(This:Carta);
   function  "<" (A,B : PCarta) return Boolean;
   
end BarajaSpanish;
