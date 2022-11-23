pragma Ada_2012;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

package body UtilidadesTipos is

   -----------------
   -- Try_Convert --
   -----------------

   function Try_Convert(Value : String; ConvertedValue : out T) return Boolean is
   Begin
      ConvertedValue := T'Value(Value);
      return True;
   exception
      when others => return False;
   end;

   procedure Get_From_Console(Value: out TT) is
      Entrada : Boolean := False;
      EntradaString : Unbounded_String;
   begin
      while (not Entrada) loop
         begin
            Put_Line("Ingresa el dato ");
            EntradaString := To_Unbounded_String(Trim(Get_Line,Both));
            Value := TT'Value(To_String(EntradaString));
            Entrada := true;
         exception
            when others =>
               Put_Line("Datos Incorrectos. Vuelva a Ingresar");
         end;
      end loop;
   end Get_From_Console;

   end UtilidadesTipos;
