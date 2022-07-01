with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package persona is
   
   type TEdad is range 0..150;
   
   type TPersona is tagged record
      Nombre : Unbounded_String;
      Edad : TEdad;
   end record;
   
   procedure Mostrar(This : TPersona);
   procedure FestejarCumple(This : in out TPersona);

end persona;
