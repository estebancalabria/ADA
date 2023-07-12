procedure Main is

   type Automovil is record
      Velocidad:Natural;
   end record;
   type Automovil_Access is access Automovil;

   function Crear return Automovil is
      A : Automovil := (Velocidad => 0);
   begin
      return A;
   end;

   Toretto : Automovil_Access;
   Airton : Automovil_Access;
begin
   Toretto := new Automovil'(Crear);
   --  Insert code here.
   null;
end Main;
