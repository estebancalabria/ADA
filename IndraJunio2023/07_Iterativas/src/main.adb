with Ada.Text_IO;use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is
   type T is delta 0.001 digits 5;
   MAX_SUMATORIA :constant Integer := 10;
   V: T := 23.322;
begin
   --  Ejemplo 1. Calcular la sumatoria de numeros de 1 a 10
   --  declare
   --     Sumatoria : Integer := 0;
   --  Begin
   --     --1..N se llama Rango
   --     for I in 1..MAX_SUMATORIA loop
   --        Sumatoria := Sumatoria + I;
   --     end loop;
   --     Put_Line("La sumatoria de 1 a 10 es " & Sumatoria'Image);
   --  end;


   --Ejemplo 2. PReguntarle al usuario la cantidad de numeros N
   --           Calcular la sumatoria de N numeros que ingresa el usuario

   --  declare
   --     type FloatDosDecimales is delta 0.01 digits 8; --fixed points
   --
   --     Cantidad : Positive;
   --     Sumatorio : Natural := 0;
   --     Numero : Positive;
   --     Promedio : FloatDosDecimales := 0.0;
   --
   --     function "/" (A:Integer; B :Integer) return FloatDosDecimales is
   --     begin
   --        return FloatDosDecimales(A) / FloatDosDecimales(B);
   --     end "/";
   --
   --     function Prompt
   --       (Texto: String := "Ingrese un numero";
   --        Mensaje_Error :String := "Numero Incorrecto, vuelva a ingresar") return Positive is
   --        Entrada_Correcta: Boolean := False;
   --        Result:Positive;
   --     begin
   --        Put_Line(Texto);
   --        while not(Entrada_Correcta) loop
   --           declare
   --              Entrada : String := Get_Line;
   --           begin
   --              Result := Positive'Value(Entrada);
   --              Entrada_Correcta := True;
   --              return Result;
   --           exception
   --              when others => Put_Line(Mensaje_Error);
   --           end;
   --        end loop;
   --        return Result;
   --     end;
   --
   --  begin
   --     Put_Line(FloatDosDecimales'First'Image);
   --     Put_Line(FloatDosDecimales'Last'Image);
   --     Put_Line(Promedio'Size'Image);
   --
   --     Cantidad := Prompt("Cuantos numeros va a introducir (<1)?");
   --     Put_Line("Introduzca "& Cantidad'Image & " numeros positivos");
   --
   --     declare
   --        Numeros : array (1..Cantidad) of Positive; --Constrained Array
   --     Begin
   --        --For I in 1..Cantidad loop
   --        For I in Numeros'Range loop
   --           Numero := Prompt("");
   --           Numeros(I) := Numero;
   --           Sumatorio := Sumatorio + Numero;
   --        end loop;
   --        --Promedio := FloatDosDecimales(Sumatorio) / FloatDosDecimales(Cantidad);
   --        Promedio := Sumatorio / Cantidad;
   --        Put_Line("El sumatorio es:" & Sumatorio'Image & " y el promedio" & Promedio'Image);
   --
   --        --Me calculen la sumatoria de los numeros pares recorriendo el arreglo
   --        Sumatorio := 0;
   --        for I in Numeros'Range loop
   --           --if Numeros(I) mod 2 = 0 then
   --           --   Sumatorio := Sumatorio + Numeros(I);
   --           --end if;
   --
   --           Sumatorio := Sumatorio + (if (Numeros(I) mod 2 = 0) then Numeros(I) else 0);
   --        end loop;
   --        Put_Line("La sumtatoria de los pares es:" & Sumatorio'Image);
   --
   --        --Otra Manera de hacer un for
   --        declare
   --           Maximo : Natural := Natural'First;
   --        begin
   --           For I in Numeros'First..Numeros'Last loop
   --              Maximo := (if Numeros(I)>Maximo then Numeros(I) else Maximo);
   --           end loop;
   --           Put_Line("El maximo valor ingresado es " & Maximo'Image);
   --        end;
   --
   --        Put_Line("Los elementos ingresados son:");
   --        For Valor of Numeros loop
   --           Put_Line(Valor'Image);
   --        end loop;
   --
   --        Put_Line("Los elementos ingresados al revez son:");
   --        For Valor of reverse Numeros loop
   --           Put_Line(Valor'Image);
   --        end loop;
   --
   --        Put_Line("Los elementos ingresados al revez son:");
   --        For I in reverse Numeros'Range loop
   --           Put_Line(Numeros(I)'Image);
   --        end loop;
   --
   --
   --
   --     end;
   --  end;

   begin
      Put_Line("Ingrese texto que se lo mostrare hasta que ingrese un string vacio");
      loop
         declare
            Entrada :String := Get_Line;
         begin
            exit when Entrada'Length=0;
            Put_Line("Ingresaste "& Entrada);
         end;
      end loop;

   end;



end Main;
