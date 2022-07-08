with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Containers.Vectors;
with Banco; use Banco;

procedure Main is
   package Cuentas is new Ada.Containers.Vectors(Index_Type => Natural, Element_Type => PCuenta);
   MiCuenta : PCuenta;
   Lista_Cuentas : Cuentas.Vector;
   Semilla:Generator;
begin
   Reset(Semilla);

   for I in 1..20 loop
      if (Random(Semilla)>0.5) then
         MiCuenta := new CuentaNomina;
      else
         MiCuenta := new CuentaEmpresa;
      end if;
      MiCuenta.Init(To_Unbounded_String("Cliente " &  I'Image));
      Lista_Cuentas.Append(MiCuenta);
   end loop;

   For Cuenta of Lista_Cuentas loop
      declare
         Saldo_Depositar : Saldo := Saldo(Random(Semilla)*1000.0);
         Saldo_Extraer :Saldo := Saldo(Random(Semilla)*1000.0);
      begin
         Cuenta.Depositar(Saldo_Depositar);
         Cuenta.Extraer(Saldo_Extraer);
      exception
          when Saldo_Insuficiente => Put_Line("No se pudo extraer");
      end;
   end loop;

   For Cuenta of Lista_Cuentas loop
      Cuenta.Mostrar;
      Put_Line("");
   end loop;

   --  MiCuenta := new CuentaNomina;
   --  MiCuenta.Init(To_Unbounded_String("Elon Musk"));
   --  MiCuenta.Depositar(1500000.00);
   --  MiCuenta.Mostrar;
   --  Put_Line("Depositando medio millon...");
   --  MiCuenta.Depositar(500000.00);
   --  MiCuenta.Mostrar;
   --
   --  Put_Line("Otro Ejemplo Cuenta Empresa");
   --  MiCuenta := new CuentaEmpresa;
   --  MiCuenta.Init(To_Unbounded_String("Empresa"));
   --  MiCuenta.Depositar(1000.0);
   --  MiCuenta.Extraer(1500.0);
   --  Put_Line("El Saldo luego de depositar 1000 y extraer 1500 de una cuenta empresa es ");
   --  MiCuenta.Mostrar;
   --
   --  Put_Line("Otro Ejemplo Cuenta Nomina");
   --  MiCuenta := new CuentaNomina;
   --  MiCuenta.Init(To_Unbounded_String("Nomina"));
   --  MiCuenta.Depositar(1000.0);
   --  MiCuenta.Extraer(1500.0);
   --  Put_Line("El Saldo luego de depositar 1000 y extraer 1500 de una cuenta empresa es ");
   --  MiCuenta.Mostrar;
   --  Put_Line("Se puede ver que el saldo sigue igual porque supere el limite de extraccion");

end Main;
