with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Strings.Fixed;
with Ada.Characters.Handling;


procedure Main is
begin

   --Ejercicio 1 : Renombre de Procedimientos Existentes y parametros por defecto
   --  declare
   --     procedure P_Print(Texto : String) renames Put_Line;
   --     procedure P_Print_Hola_Mundo(Text : String := "Hola Mundo") renames Put_Line;
   --  begin
   --     P_Print("Bienvenidos a la clase tres de ADA");
   --     P_Print_Hola_Mundo;
   --  end;

   --Ejercicio 2 : Procedimientos anidados
   --  declare
   --     use Ada.Float_Text_IO;
   --     V_A : Float := 2.0;
   --     V_B : Float := 3.5;
   --
   --     procedure P_Put_Float(Num:Float; Fore:Integer := 1; After : Integer := 2; Exp:Integer :=0) renames Put;
   --
   --     --Metodos que usan variables globales
   --     --Esto es "El lado oscuro de ADA"
   --     --Mucho no lo recomiendo
   --        procedure P_Invertir_A_B is
   --           Aux : Float := V_A;
   --        begin
   --           New_Line;
   --           V_A := V_B;
   --           V_B := Aux;
   --     end P_Invertir_A_B;
   --
   --  begin
   --     P_Put_Float(V_A);
   --     New_Line;
   --     P_Put_Float(V_B);
   --
   --     P_Invertir_A_B;
   --
   --     P_Put_Float(V_A);
   --     New_Line;
   --     P_Put_Float(V_B);
   --  end;

   --Ejercicio 3 : Nuevo Tipo de Datos : ENUMERADOS
   --  declare
   --     use Ada.Strings.Fixed;
   --     use Ada.Characters.Handling;
   --
   --     type T_Dias_Semana is (E_Lunes, E_Martes, E_Miercoles, E_Jueves, E_Viernes, E_Sabado, E_Domingo);
   --     V_Hoy_Es : T_Dias_Semana := E_Viernes;
   --
   --     function P_To_String(Dia : T_Dias_Semana) return String is
   --        V_Result : String := Dia'Image(Dia'Image'First+2..Dia'Image'Last);
   --
   --        --Original es 'E_VIERNES' y su rango es (1..9)
   --        --V_Result es 'VIERNES y su rango es (3..9)
   --        --Son dos variables distintas
   --        --En ada los arreglos no necesariamente empiezan en 0 o 1
   --
   --     begin
   --        --Opcion 1
   --        --Del segundo caracter al utimo lo conviero a minuscula
   --        --for Pos in V_Result'First+1..V_Result'Last loop
   --        --   V_Result(Pos) := To_Lower(V_Result(Pos));
   --        --end loop;
   --
   --        --return V_Result;
   --
   --        --Opcion 2 : Usando la sobrecarga del To_Lower que recibe Strings
   --        return V_Result(V_Result'First) & To_Lower(V_Result(V_Result'First+1..V_Result'Last));
   --     end;
   --
   --     --  V_1 : String := "Hola Mundo";
   --     --  V_2 : String := V_1(6..V_1'Last);
   --
   --  begin
   --     --Los Strins (Los arreglos en general) no necesariamente empiezan en la posicion 1
   --     --  Put_Line("V_1 es " & V_1);
   --     --  Put_Line("La primer posicion de V_1 es " & V_1'First'Image);
   --     --  Put_Line("V_2 es " & V_2);
   --     --  Put_Line("La longitud de V_2 es " & V_2'Length'Image);
   --     --  Put_Line("La primer posicion de V_2 es " & V_2'First'Image);
   --     --Put_Line("La ultima posicion de V_2 es " & V_2'Last'Image);
   --     Put_Line("Hoy es " & P_To_String(V_Hoy_Es));
   --
   --     --V_Hoy_Es := V_Hoy_Es + 1; No me deja
   --
   --     Put_Line("Los Dias de la Semana Son : ");
   --     --for variable in Tipo_Discreto
   --     for Dia in T_Dias_Semana loop
   --        Put_Line(P_To_String(Dia));
   --     end loop;
   --
   --     Put_Line("Los Dias de la Semana Sin el fin de Semana Son : ");
   --     --for variable in Tipo_Discreto
   --     for Dia in T_Dias_Semana loop
   --        Put_Line(P_To_String(Dia));
   --        exit when Dia=E_Viernes;
   --     end loop;
   --
   --     --No se puede iterar sobre enumerados con un for of
   --     --  for Dia of T_Dias_Semana loop
   --     --     null;
   --     --  end loop;
   --
   --
   --
   --     --Asi puedo iterar todos los enteros
   --     --  for Num in Integer loop
   --     --     Put_Line(Num'Image);
   --     --  end loop;
   --
   --     --  for Num in Short_Short_Integer loop
   --     --     Put_Line(Num'Image);
   --     --  end loop;
   --
   --     --No compila porque no es un tipo discreto
   --     --  for F in Float loop
   --     --     null;
   --     --  end loop;
   --  end;

   -- Ejemplo 4 : Tipos de Datos
   --  declare
   --     use Ada.Float_Text_IO;
   --     type T_Metros is new Integer;
   --
   --     --Lo puedo declarar de las siguientes manera
   --     --type T_Segundos is range 0..Integer'Last;
   --
   --     type T_Segundos is new Integer range 0..Integer'Last;
   --
   --     type T_Metros_Sobre_Segundo is new Float;
   --
   --     function "/"(V_Distancia:T_Metros; V_Segundos : T_Segundos) return T_Metros_Sobre_Segundo is
   --     begin
   --        return T_Metros_Sobre_Segundo(V_Distancia) / T_Metros_Sobre_Segundo(V_Segundos);
   --     end;
   --
   --     function To_String(V : T_Metros_Sobre_Segundo) return String is
   --     begin
   --        return V'Image & " m/s";
   --     end;
   --
   --     V_Distancia_Recorrida : T_Metros;
   --     V_Tiempo_Transcurrido : T_Segundos;
   --     V_Numero : Integer;
   --     V_Velocidad : T_Metros_Sobre_Segundo;
   --  begin
   --     V_Distancia_Recorrida := 120;                      --ok
   --     V_Numero := 180;                                   --ok
   --     V_Tiempo_Transcurrido := 20;                       --ok
   --     --V_Distancia_Recorrida := V_Numero;               --fail
   --     V_Distancia_Recorrida := T_Metros(V_Numero);       --ok con casteo
   --     --V_Distancia_Recorrida := V_Tiempo_Transcurrido;    --fail son incompatibles
   --
   --     --Para que la siguiente linea funcione tendria que castear
   --     --Yo recomiendo evitar los casteos salvo en la sobrecarga de operadores
   --     V_Velocidad := V_Distancia_Recorrida / V_Tiempo_Transcurrido;
   --
   --     Put_Line("La velocidad es " & To_String(V_Velocidad));
   --  end;

   --Ejemplo 5 : Subtipos
   --  declare
   --     subtype T_Numeros_Mayores_Que_100 is Integer range 100..Integer'Last;
   --
   --     V_Numero : Integer;
   --     V_Numero_Mayor : T_Numeros_Mayores_Que_100;
   --  begin
   --     V_Numero := 1000;
   --     V_Numero_Mayor := V_Numero; --ok, porque son subtipos, son compatibles
   --
   --     declare
   --     begin
   --        V_Numero := 99;  --Ya tira un Warning
   --        V_Numero_Mayor := V_Numero; --La asignacion es valida pero falla en tiempo de ejecucion
   --     exception
   --        when others => Put_Line("Asignacion invalida en tiempo de ejecucion");
   --     end;
   --
   --     V_Numero := 99;
   --     if (V_Numero in T_Numeros_Mayores_Que_100) then
   --        V_Numero_Mayor := V_Numero;
   --     else
   --        V_Numero_Mayor := 100;
   --     end if;
   --  end;

   --Ejemplo 6 : Tipos con arreglos
   --            (Constrained y Unconstrained)
   --Constrained : Tienen una longitud fija
   --Unconstrainrd : Tiene una logintud variable,
   --                pero al momento de de declarar una variable de ese tipo
   --                se debe especificar la longitud (Ejemplo String)
   --  declare
   --
   --     --type T_Siglas_Aeropuerto is array (1..3) of Character; --Tipo_Constrained
   --     --Lo mejoramos a lo "Ada's Style"
   --     subtype T_Caracacter_Mayuscula is Character range 'A'..'Z';
   --     type T_Siglas_Aeropuerto is array (1..3) of T_Caracacter_Mayuscula;
   --
   --     --Les presento al <>
   --     type T_Array_Integer is array (Integer range <>) of Integer; --Tipo Unconstrained
   --
   --     Aeropuerto_Madrid : T_Siglas_Aeropuerto;
   --     --Numeros_Loteria : T_Array_Integer; --Asi falla porque tengo que especificar el size
   --     --Numeros_Loteria : T_Array_Integer(1..5); --Sin Inicializar
   --     Numeros_Loteria : T_Array_Integer(1..5) := (1,2,3,4,5);--Con Inicializacion
   --     --Numeros_Loteria : T_Array_Integer(1..5) := (1=> 60, 2=> 45, 3=> 27, <> => 99); --Forma endemoniada
   --  begin
   --     Aeropuerto_Madrid := "MAD";
   --     Aeropuerto_Madrid := ('M','A','D');
   --     --Aeropuerto_Madrid := "mAD";  --fail con la nueva version
   --     Put_Line("Aeropuerto Madrid: "
   --              & Aeropuerto_Madrid(1)
   --              & Aeropuerto_Madrid(2)
   --              & Aeropuerto_Madrid(3));
   --
   --     Put_Line("Los Numeros de la loteria son");
   --     for Num of Numeros_Loteria loop
   --        Put_Line(Num'Image);
   --     end loop;
   --  end;


   --Ejemplo 7 : Tipos Modulares (Sin Signo ni overflow)
   --  declare
   --     type T_Ancho_Patalla is mod 80; --Va entre 0 y 79
   --
   --     V_Pos_X : T_Ancho_Patalla;
   --  begin
   --     --  V_Pos_X := 0;
   --     --
   --     --  for I in Short_Integer loop
   --     --     for Pos in 1..V_Pos_X loop
   --     --        Put(" ");
   --     --     end loop;
   --     --     Put("*");
   --     --     New_Line;
   --     --     V_Pos_X := V_Pos_X + 1;  --Sim me paso de 80 vuelve a empezar
   --     --  end loop;
   --
   --     V_Pos_X := 79;
   --     Put_Line(V_Pos_X'Image);
   --     V_Pos_X := V_Pos_X +1;
   --     Put_Line(V_Pos_X'Image);
   --     V_Pos_X := V_Pos_X +1;
   --     Put_Line(V_Pos_X'Image);
   --  end;

   --  --Ejemplo 8 : Declaracion de tipos flotantes
   --  declare
   --     use Ada.Float_Text_IO;
   --     --No son tipos discretos
   --     type T_Angulo is new Float range 0.0..360.0;
   --     type T_Angulo_D3 is new Float digits 3 range 0.0..360.0; --Me asegura precision para 3 digitos
   --     --subtype T_Angulo is Float range 0.0..360.0;
   --
   --     function To_String(V_Angulo : T_Angulo; V_Cantidad_Decimales : Integer := 10) return String is
   --        V_Digitos_Enteros: Integer := Integer(Float'Truncation(Float(V_Angulo)))'Image'Length -1;
   --        Result : String(1..V_Digitos_Enteros + V_Cantidad_Decimales + 1);
   --     begin
   --        Put(To => Result,
   --            Item => Float(V_Angulo),
   --            Aft => V_Cantidad_Decimales,
   --            Exp => 0);
   --
   --        return Result;
   --     end;
   --
   --
   --     V_Angulo : T_Angulo := 99.82323;
   --     V_Angulo_2 : T_Angulo_D3 := 45.82323;
   --
   --     --Entera : Integer := Integer(V_Angulo);  --Lo redondea
   --     Entera : Integer := Integer(Float'Truncation(Float(V_Angulo)));  --Lo trunca
   --  begin
   --     Put_Line(Entera'Image);
   --     --Put("El Angulo es ");
   --
   --     --El siguiete funciona con subtype --subtype T_Angulo is Float range 0.0..360.0;
   --     --Put(V_Angulo, Fore => 0, Aft =>10, Exp => 0); --Con Type no funciona porque Float es incompatible con T_angulo
   --     --Put(Float(V_Angulo), Fore => 0, Aft =>10, Exp => 0);
   --     Put_Line("El Angulo es " & To_String(V_Angulo));
   --
   --     Put("El Angulo2 es ");
   --     Put(Float(V_Angulo_2), Fore => 0, Aft =>10, Exp => 0);
   --     New_Line;
   --  end;


   --Ejemplo 9 : Decimales de punto fijo
   -- El float la coma se mueve
   -- El punto fijo la coma no se mueve
   declare
      use Ada.Float_Text_IO;

      type T_Money is digits 2; --Me asegura trabajar con 2

      type T_Money_2 is delta 0.1 digits 1;
      --type T_Money_2 is delta 10.0** (-3) digits 6; --No anda

      V_Saldo : T_Money;
      V_Saldo_2 : T_Money_2;
   begin
      V_Saldo := 10.43545478;
      Put(Float(V_Saldo), Exp => 0); --al castear lo convierte de punto fijo a punto Flotante
      New_Line;
      V_Saldo := V_Saldo + 0.000000001;
      Put(Float(V_Saldo), Exp => 0);

      New_Line;
      V_Saldo_2 := 1.1;
      Put(Float(V_Saldo_2), Exp => 0); --al castear lo convierte de punto fijo a punto Flotante
      New_Line;
      V_Saldo := V_Saldo + 0.000000001;
      Put(Float(V_Saldo_2), Exp => 0);
   end;


end Main;
