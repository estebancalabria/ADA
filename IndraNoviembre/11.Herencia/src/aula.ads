with Ada.Containers.Vectors;

generic type Tipo_Integrantes is private;
with procedure Mostrar_Integrante(Item :Tipo_Integrantes);   
package Aula is

   package Lista_Integrantes is new Ada.Containers.Vectors(Element_Type =>  Tipo_Integrantes,
                                                           Index_Type => Positive);

   Asistentes : Lista_Integrantes.Vector;
   
   procedure Mostrar_Asistentes;

end Aula;
