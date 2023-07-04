with Ada.Text_IO; use Ada.Text_IO;
with Integer_Array; use Integer_Array;

procedure Main is

begin
   declare
      --N : Numeros; --Me tira un error porque no sabe cuanta memoria necesita
      N : Conjunto_De_Numeros:= Crear(5,Default => 10);  --Creo implicitamente ej: s:string:= "12"
   begin
      --N := (1,2,3,4,5); --Esta linea no funciona porque el tipo numeros es privado
      N := Crear_Secuencia(1,5);
      Mostrar_Numeros(N);

      declare
         N_Mas_6 : Conjunto_De_Numeros := Agregar(6, N); --IMPORTANTE : Si o si tengo que declarar otra variable
         N_Mas_Otro_6 : Conjunto_De_Numeros := Agregar (6, N_Mas_6);
      begin
         Mostrar_Numeros(N_Mas_6);
         Mostrar_Numeros(N_Mas_Otro_6);
      end;

      if Pertenece(5,N) then
         Put_Line("El 5 esta en la secuencia");
      end if;

      --  if 5 in N then
      --     Put_Line("dsd");
      --  end if;

      Mostrar_Numeros(N);
      Revertir(N);
      Mostrar_Numeros(N);

      declare
         Na : Conjunto_De_Numeros := Crear_Secuencia(1,3);
         Nb : Conjunto_De_Numeros := Crear_Secuencia(3,6);
         Res : Conjunto_De_Numeros := Na & Nb;
         --N4 : Numeros := N3 & 4;
        -- N5 : Numeros := Slice(N3,3,5); --Subarreglos, tiene que estar dentro del rango
         --N6 :Numeros (1..2) := (1=>1, 2=><>);
      begin
         Mostrar_Numeros(Res);
         --Mostrar_Numeros(N4);
         --Mostrar_Numeros(N5);
         --Mostrar_Numeros(N6);
         null;
      end;

   end;


end Main;
