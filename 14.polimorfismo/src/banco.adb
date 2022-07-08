with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Banco is

   procedure Init(This:in out Cuenta; Titular:Unbounded_String) is
   begin
      This.Dinero_Disponible := 0.00;
      This.Titular := Titular;
   end;
   
   procedure Depositar(This:in out Cuenta; Saldo_Depositar : Saldo) is
   begin
      This.Dinero_Disponible := This.Dinero_Disponible + Saldo_Depositar;
   end;
   
   function Get_Saldo(This:Cuenta) return Saldo is
   begin
      return This.Dinero_Disponible;
   end;
   
   function Get_Titular(This:Cuenta) return Unbounded_String is 
   begin
      return This.Titular;
   end;
   
   procedure Extraer(This:in out CuentaEmpresa; Saldo_Extraer:Saldo) is
   begin
      This.Dinero_Disponible := This.Dinero_Disponible - Saldo_Extraer;
   end;
   
   procedure Mostrar(This:CuentaEmpresa) is
   begin
      Put_Line("Resumen de Cuenta Empresa");
      Put_Line("-------------------------");
      Put("Titular : ");
      Put(To_String(This.Titular));
      Put_Line("");
      Put("Saldo : ");
      Put(Float(This.Dinero_Disponible),0,2,0);
      Put_Line("");
   end;
   
   procedure Extraer(This:in out CuentaNomina; Saldo_Extraer:Saldo) is
   begin
      if (Saldo_Extraer < This.Dinero_Disponible) then
          This.Dinero_Disponible := This.Dinero_Disponible - Saldo_Extraer;
      else
         raise Saldo_Insuficiente 
           with "Disponible " & This.Dinero_Disponible'Image & " Monto " & Saldo_Extraer'Image;
      end if;
   end;
   
   
   procedure Mostrar(This:CuentaNomina) is
   begin
      Put_Line("Resumen de Cuenta Nomina");
      Put_Line("-------------------------");
      Put("Titular : ");
      Put(To_String(This.Titular));
      Put_Line("");
      Put("Saldo : ");
      Put(Float(This.Dinero_Disponible),0,2,0);
      Put_Line("");
   end;
end Banco;
