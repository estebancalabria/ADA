with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Strings;
use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Ada.Strings.Fixed;
use Ada.Strings;

package body Consola is

   function Get_NotEmpty_String(pregunta : String) return Unbounded_String
   is
      Entrada : Unbounded_String;
   begin
      Put_line(pregunta);
      loop
         Entrada := To_Unbounded_String (Trim(Ada.Text_IO.Get_Line,Both));
         exit when Length(Entrada) > 0;
         Put_Line("Ingreso Vacio. Vuelva a ingresarlo...");
      end loop;
      return Entrada;
   end Get_NotEmpty_String;

   function Is_Integer(NumericString:String) return Boolean is
      Conversion : Integer;
   Begin
      --Trata de hacer la conversionn
     Conversion := Integer'Value(NumericString);
     return True;
   exception
      when others => return False;
   end Is_Integer;

   function Is_Float (NumericString : String) return Boolean is
      Conversion : Float;
   begin
      --Trata de hacer la conversion
      Conversion := Float'Value(NumericString);
      return True;
   exception
      when others => return False;
   end;

   function Get_NotEmpty_Integer(Pregunta : String) return Integer is
      Entero : Integer;
      Input : Boolean := False;
      StringInput : Unbounded_String;
   begin
      while (not Input) loop
         Put_Line(Pregunta);
         StringInput := To_Unbounded_String(Trim(Get_Line, ADA.Strings.Both));
         if (Length(StringInput) > 0) and (Is_Integer(To_String(StringInput))) then
            Entero := Integer'Value(To_String(StringInput));
            Input := true;
         else
           Put_Line("Se espera un numero. Vuelva a Igresar");
         end if;
      end loop;
      return Entero;
   end Get_NotEmpty_Integer;

   function Get_NotEmpty_Float(Pregunta : String)  return Float is
      flo : Float;
      valor : Unbounded_String;
   begin
      loop
         Put_Line(Pregunta);
         valor := To_Unbounded_String(Trim(Get_Line, Both));
         exit when ((Length(valor)/=0) AND (IS_Float(To_String(valor))=true));
      end loop;
      flo := Float'Value(To_String(valor));
      return flo;
   end Get_NotEmpty_Float;

end Consola;
