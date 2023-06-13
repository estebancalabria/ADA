with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package modelo is

   type Clase_Animal is abstract tagged null record; --null record es una clase 
   type Access_Animal is access all Clase_Animal'Class; --puede apuntar a un objeto de la clase animal 
                                                        --o cualquiera de las subclases
                                                        --los objetos viven en el heap
              
   
   function To_String(This:Clase_Animal) return String is abstract;
   
   type Clase_Iguana is new Clase_Animal with null record;
   overriding function To_String(This:Clase_Iguana) return String;  --una primitiva de la Clase_Iguana
   
   type Clase_Gallina is new Clase_Animal with null record;
   --type Clase_Gallina is new Clase_Animal with record Nombre:Unbounded_String; end record;
   overriding function To_String(This:Clase_Gallina) return String;

end modelo;
