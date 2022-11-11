with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   --Nombre : String := Get_Line; No puedo preguntar antes
   --Va a preguntarle un string al usuario hasta que no sea vacio
   function Get_Non_Empty_Line
     (Prompt:String := "Ingrese un texto no vacio";
     Error:String := "Ha Ingresado un texto vacio, vuelva a intentarlo") return String is
   begin
      Put_Line(Prompt);
      Lectura_Datos : loop
         declare
            Texto : String := Get_Line;
         begin
            if (Texto'Length>0) then
               return Texto;
            end if;
            Put_Line(Error);
         end;
      end loop Lectura_Datos;
   end Get_Non_Empty_Line;

   function Try_Convert_Integer
     (Texto:in String;
      Texto_Como_Entero:out Integer) return Boolean is
   begin
      Texto_Como_Entero := Integer'Value(Texto);
      return True;
   exception
      --when Constraint_Error => return False;
      when others => return False;
   end;

   --Va a preguntar un valor hasta que el usuario ingrese un entero
   --Usar la funcion anterior Try_Convert_Integer
   function Get_Integer
     (Prompt:String := "Ingresa un numero";
      Error:String := "No ha ingresado un numero, vuelva a intentarlo") return Integer is
      Result : Integer := 0;
   begin
      Put_Line(Prompt);
      while (not(Try_Convert_Integer(Get_Line, Result))) loop
         Put_Line(Error);
      end loop;
      return Result;
   end Get_Integer;

   function Get_Integer_Between
     (Min:Integer;
      Max:Integer;
      Prompt:String := "Ingrese un numero";
      Empty_Error:String := "Texto Vacio, Vuelva a Intentar";
      Underflow_Error:String := "Numero muy chico";
      Overflow_Error:String := "Numero muy grande") return Integer is
     Result : Integer;
   begin
      loop
         Result := Get_Integer(Prompt, Empty_Error);
         if Result > Max then
           Put_Line(Overflow_Error);
         elsif Result<Min then
           Put_Line(Underflow_Error);
         else
            return Result;
         end if;
      end loop;
   end;


begin
   --Put_Line("Ingrese Su Nombre");
   declare
      Nombre : String := Get_Non_Empty_Line("Ingrese Su Nombre"); --Declaracion de String en forma Implicita
      Edad : Integer := 0;
      --Nombre : String(1..100); --Explicita
   begin
      --Put_Line("Hola " & Nombre);
      --Put_Line("Ingrese Su Edad");
      Edad := Get_Integer("Ingrese Su Edad");
      Put_Line("Hola " & Nombre & " de " & Edad'Image & " años");
      --  declare
      --     Edad : Integer := 0;
      --  begin
      --     if (Try_Convert_Integer(Get_Line, Edad)) then
      --        Put_Line("Tienes " & Edad'Image);
      --     else
      --        Put_Line("No Ingresaste un numero");
      --     end if;
      --  end;
   end;
end Main;
