package Integer_Array is
   type Conjunto_De_Numeros (<>) is private;
   
   procedure Mostrar_Numeros(Lista_Numeros :in Conjunto_De_Numeros);
   function Crear(Cantidad:Integer; Default : Integer) return Conjunto_De_Numeros;
   function Crear_Secuencia(Valor_Inicial:Integer; Valor_Final: Integer) return Conjunto_De_Numeros;
   --crear(1,10) => (1,2,3,4,5,6,7,8,9,10);
   
   procedure Revertir(Lista_Numeros: in out Conjunto_De_Numeros); --(1,2,3) ==> (3,2,1)
   
   function "&" (Source:Conjunto_De_Numeros; Dest:Conjunto_De_Numeros) return Conjunto_De_Numeros;
   --function "&" (Source:Numeros; Dest:Integer) return Numeros;
   function Slice(Source:Conjunto_De_Numeros; From:Integer; To:Integer) return Conjunto_De_Numeros;
   
   function Pertenece(Valor:Integer; Arreglo:Conjunto_De_Numeros) return Boolean;
   
   function Agregar(Valor:integer; Arreglo:Conjunto_De_Numeros) return Conjunto_De_Numeros;
--   procedure Add(Valor:integer; Arreglo:in out Numeros);
private
   --type Conjunto_De_Numeros is array (Integer range <>) of Integer with Default_Component_Value => 10;
   type Conjunto_De_Numeros is array (1..10) of Integer with Default_Component_Value => 10;
end Integer_Array;
