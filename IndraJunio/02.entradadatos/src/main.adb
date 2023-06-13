with Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Strings;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;

procedure Main is
   use Ada.Text_IO;
   use Ada.Strings.Fixed;
   use Ada.Strings;
   use Ada.Strings.Unbounded;
   use Ada.Integer_Text_IO;
   Edad:Integer;

   function Es_Numerico(N:String) return Boolean is
      Num : Integer;
   begin
      Num := Integer'Value(N);
      return True;
   exception
      when others => return False;
   end Es_Numerico;

begin
  Put_Line("Ingrese Su Nombre");
  declare
     S : String := Get_Line;
  begin
    Put_Line("Hola " & S);
  end;
   --if (Es_Numerico("123")) then Put_Line("123 es numerico"); end if;
   --if (not Es_Numerico("abc")) then Put_Line("abc no es numerico"); end if;


   --Ejemplo de entrada de datos String
   --Put_Line("Ingrese Su Nombre");
   --  declare
   --     Nombre : String := Trim(Get_Line, Both); --El trim remueve espacios adelante y atras
   --  begin --El begin end del bloque declare define el scope (alcance) de la variable
   --     if (Nombre'Length = 0) then
   --        Put_Line("Hola, usted no ha ingresado su nombre");
   --     else
   --       Put_Line("Bienvenido " & Nombre );
   --     end if;
   --  end;

   -- La Mejoramos con un while
   --Opcion con variable booleana
   --  Put_Line("Ingrese Su Nombre");
   --  declare
   --     NombreCorrecto : Boolean := False;
   --  begin
   --     while (not NombreCorrecto) loop
   --        declare
   --           Nombre : String := Trim(Get_Line, Both);
   --        begin
   --           NombreCorrecto := Nombre'Length > 0;
   --           if (NombreCorrecto) then
   --              Put_Line("Bienvenido " & Nombre );
   --           else
   --              Put_Line("Por Favor vuelva a ingresar el nombre");
   --           end if;
   --        end;
   --     end loop;
   --  end;

   Put_Line("Ingrese Su Nombre");
   declare
      Nombre: Unbounded_String;
      --Nombre : String := Trim(Get_Line, Both);
   begin
      Nombre := To_Unbounded_String(Trim(Get_Line, Both));
      while (Length(Nombre)=0) loop
         Put_Line("Vuelva a Ingresarlo...");
         Nombre := To_Unbounded_String(Trim(Get_Line, Both));
      end loop;
      Put_Line("Bienvenido " & To_String(Nombre) );
   end;


   --Put_Line("Ingrese su Edad");
   ----Get(Edad); --Puede Tirar una exception Data_error
   --Edad := Integer'Value(Get_Line);  --Puede tirar una esception Constaint_error
   loop
      Put_Line("Ingrese su Edad");
      declare
         Entrada : String := Get_Line;
      Begin
         if (Es_Numerico(Entrada)) then
            Edad := Integer'Value(Entrada); --Puedo realizar la conversion tranquilo porque se que no va a fallar
         end if;
         exit when (Es_Numerico(Entrada));
      end;
   end loop;

   if (Edad<5) then
      Put_Line("Usted es un niño aun...");
   elsif (Edad in 6..17) then
      Put_Line("Usted es menor de edad");
   else
      Put_Line("Usted ya es mayor de edad");
   end if;

exception
   when Data_Error => Put_Line("Se esperaba un numero y se han ingresado caracteres no numericos");
   --when Constraint_Error => Put_Line("Se esperaba un numero que no se ha ingresado");
end Main;
