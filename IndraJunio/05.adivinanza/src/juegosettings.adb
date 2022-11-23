with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Text_IO;

package body JuegoSettings is

   -------------------------
   -- Is_EnteroEntre1y100 --
   -------------------------

   function Is_EnteroEntre1y100(Valor:String) return Boolean is
     Num : EnteroEntre1y100;
   Begin
     Num := EnteroEntre1y100'Value(Valor);  --Esto me tira una exception si esta fuera de rango o si son letras
     return True;
   exception
      when others => return False;
   end Is_EnteroEntre1y100;

   --------------------------
   -- Get_EnteroEntre1y100 --
   --------------------------

   function Get_EnteroEntre1y100 return EnteroEntre1y100 is
      use Ada.Strings;
      use Ada.Strings.Fixed;
      use Ada.Text_IO;
   begin
      loop
         Put_Line("Ingrese un entero entre 1 y 100");
         declare
            Entrada : String := Trim(Get_Line,Both);
         begin
            if (Is_EnteroEntre1y100(Entrada)) then
               return EnteroEntre1y100'Value(Entrada);
            end if;
         end;
         Put_Line("El dato ingresados no es un numero entre 1 y 100");
      end loop;
   end;
end JuegoSettings;
