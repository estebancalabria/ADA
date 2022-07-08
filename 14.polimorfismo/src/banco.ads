with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Banco is
   
   Saldo_Insuficiente : exception;

   type Saldo is digits 2;
   
   type Cuenta is abstract tagged private;
   type PCuenta is access Cuenta'Class;  --El atributo 'Class se utiliza para que podamos apuntar a una instancia
                                         --de cualquier subclase
                                         
   procedure Init(This:in out Cuenta; Titular:Unbounded_String);
   procedure Depositar(This:in out Cuenta; Saldo_Depositar : Saldo);
   procedure Extraer(This:in out Cuenta; Saldo_Extraer:Saldo) is abstract;
   procedure Mostrar(This:Cuenta) is abstract;
   function Get_Saldo(This:Cuenta) return Saldo;
   function Get_Titular(This:Cuenta) return Unbounded_String;
   
   
   type CuentaEmpresa is new Cuenta with private;
   overriding procedure Extraer(This:in out CuentaEmpresa; Saldo_Extraer:Saldo);
   overriding procedure Mostrar(This:CuentaEmpresa);
   
   type CuentaNomina is new Cuenta with private;
   overriding procedure Extraer(This:in out CuentaNomina; Saldo_Extraer:Saldo);
   overriding procedure Mostrar(This:CuentaNomina);

private
   
   type Cuenta is abstract tagged
      record
         Dinero_Disponible : Saldo;
         Titular : Unbounded_String;
      end record;
   
   type CuentaEmpresa is new Cuenta with
      record
         null;
      end record;
   
   type CuentaNomina is new Cuenta with
      record
         null;
      end record;
   

end Banco;
