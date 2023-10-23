with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random;
with Ada.Float_Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;
with Consola;

procedure Main is

begin
   -- Ejericio 1 : Generar numeros al azar
   --  declare
   --     use Ada.Numerics.Float_Random;
   --     use Ada.Float_Text_IO;
   --     use Ada.Strings;
   --     use Ada.Strings.Fixed;
   --
   --     --Declarando constantes
   --     C_Min_Random : constant Integer := 1;
   --     C_Max_Random : constant Integer := 10;
   --
   --     type T_Numero_Al_Azar is range C_Min_Random..C_Max_Random;
   --
   --     procedure P_Put_Float
   --       (Item:Float;
   --        Fore:Field := 0;
   --        Aft:Field := Float'Digits;
   --        Exp:Field := 0) renames Put;
   --
   --     V_Generador : Generator;
   --     --V_Numero_Al_Azar : Uniformly_Distributed;
   --
   --     --Podria declararlo asi
   --     -- V_Entero_Al_Azar : Integer;
   --     --Pero mejor asi a lo ada
   --     --V_Entero_Al_Azar : T_Integer_1_TO_10;
   --     --Ahora con contantes
   --     V_Entero_Al_Azar : T_Numero_Al_Azar;
   --
   --     --V_Entero : Integer := 0;
   --     --V_Entero_Grande : Long_Integer := 0;
   --     --V_Entero_Muy_Grande : Long_Long_Integer := 0;
   --
   --  begin
   --     --Put_Line(V_Entero'Size'Image);
   --     --Put_Line(V_Entero_Grande'Size'Image);
   --     --Put_Line(V_Entero_Muy_Grande'Size'Image);
   --
   --     --Opcion 1 : -- Generar 20 enteros al azar entre 1 y 10;
   --     Reset(V_Generador);
   --     Put_Line("Generamos 10 numeros al azar entre 1 y 10");
   --
   --     For I in 1..10 loop
   --
   --        --Formula N := MIN + Random + (MAX-MIN);
   --
   --        --V_Entero_Al_Azar := T_Integer_1_TO_10
   --        --  (Float(T_Integer_1_TO_10'First)
   --        --   + Random(V_Generador)
   --        --   * Float(T_Integer_1_TO_10'Pred(T_Integer_1_TO_10'Last)));
   --
   --        V_Entero_Al_Azar := T_Numero_Al_Azar
   --          (Float(C_Min_Random) + Random(V_Generador) * Float(C_Max_Random-C_Min_Random));
   --
   --        Put_Line(Trim(V_Entero_Al_Azar'Image, Both));
   --     end loop;
   --  end;

   --Ejemplo 2 : Mas tipos de datos
   --            Predicados
   --  declare
   --     -- | operador choice
   --     type T_Pares_Entre_1_y_10 is new Integer
   --       with Static_Predicate => T_Pares_Entre_1_y_10 in 2 | 4 | 6 | 8 | 10;
   --
   --     type T_Pares is new Integer
   --       with Dynamic_Predicate => (T_Pares mod 2 = 0);
   --
   --     V_Numero_Par_Entre_1_Y_10 : T_Pares_Entre_1_y_10;
   --     V_Numero_Par : T_Pares;
   --  begin
   --     V_Numero_Par_Entre_1_Y_10 := 5; --Me dejo! raaaaro
   --
   --     for I in T_Pares_Entre_1_y_10 loop
   --        Put_Line(I'Image);
   --     end loop;
   --
   --     if (V_Numero_Par_Entre_1_Y_10 in T_Pares_Entre_1_y_10) then
   --        Put_Line("Es un numero par entre 1 y 10");
   --     end if;
   --
   --     V_Numero_Par := 45;
   --     --Con un predicado dinamico no puedo hacer un for
   --     --for I in T_Pares loop
   --     --   Put_Line(I'Image);
   --     --end loop;
   --     if V_Numero_Par in T_Pares then
   --        Put("Es Par");
   --     else
   --        Put("Es Impar");
   --     end if;
   --  end;


   -- Ejemplo 3 : Funciones personalizadas de entrada de datos
   --  declare
   --     --Se Animan a programar la funcion F_Es_Numero
   --     function F_Es_Numero(Item : String) return Boolean is
   --       Conversion : Integer;
   --     begin
   --        Conversion := Integer'Value(Item);
   --        return True;
   --     exception
   --        when others => return False;
   --     end;
   --
   --     --Quiero una funcion que lea la entrada con un while
   --     --hasta que el usuario ingrese algo
   --     --Si ingresa un string vacio o espacios le vuelve a preguntar
   --     function F_Get_Line_Not_Empty
   --       (Empty_Error_Message : String := "Se esperaba una entrada no vacia. Vuelva a Intentar.") return String is
   --        use Ada.Strings.Fixed;
   --     begin
   --
   --        loop
   --           declare
   --              Entrada : String := Get_Line;
   --           begin
   --              if Trim(Entrada,Ada.Strings.Both)'Length > 0 then
   --                 return Entrada;
   --              end if;
   --
   --              Put_Line(Empty_Error_Message);
   --           end;
   --        end loop;
   --     end;
   --
   --     --Quiero que me pida que ingrese hasta que sea un integer
   --     function F_Get_Integer
   --       (Empty_Error_Message : String := "Se esperaba una entrada no vacia. Vuelva a Intentar."
   --       Not_Integer_Error_Message  : String := "Se esperaba un numero. Vuelva a Intentar."
   --       ) return Integer is
   --     begin
   --        loop
   --           declare
   --              V_String : String := F_Get_Line_Not_Empty;
   --           begin
   --              if f_es_numero(v_string) then
   --                 return Integer'Value(v_string);
   --              end if;
   --              Put_Line(Not_Integer_Error_Message);
   --           end;
   --        end loop;
   --     end F_get_integer;
   --
   --
   --     --Entrada : String;
   --  begin
   --     --  Put_Line("Ingrese algo...");
   --     --  declare
   --     --     Entrada : String := Get_Line_Not_Empty;
   --     --  begin
   --     --     Put_Line(Entrada);
   --     --     if F_Es_Numero(Entrada) then
   --     --        Put_Line("Usted ingreso un Numero");
   --     --     else
   --     --        Put_Line("Usted no ingreso un Numero");
   --     --     end if;
   --     --  end;
   --
   --     Put_Line("Ingrese un numero...");
   --     declare
   --        Entrada : Integer;
   --     begin
   --        Entrada := F_Get_Integer;
   --        Put_Line("Ingreso el numero" & Entrada'Image);
   --     end;
   -- end;

   --Ejemplo 4 : Revisitando nuestros amigos los array
   --  declare
   --     type T_Constrained_Integer_Array is array (1..20) of Integer;
   --     type T_Unconstrained_Integer_Array is array (Positive range <>) of Integer with Default_Component_Value => 35;
   --
   --     --V_Arr : T_Unconstrained_Integer_Array(1..5) := (others => 10);
   --     --V_Arr : T_Unconstrained_Integer_Array(1..5);
   --     V_Sub_Arr_1 : T_Unconstrained_Integer_Array := (1,2,3,4);
   --     V_Sub_Arr_2 : T_Unconstrained_Integer_Array := (5,6,7,8);
   --     V_Arr : T_Unconstrained_Integer_Array := V_Sub_Arr_1 & V_Sub_Arr_2;
   --
   --     --Array Slices
   --     --V_Pedacito_Arr : T_Unconstrained_Integer_Array := V_Arr(2..5); --A lo python
   --     V_Pedacito_Arr : T_Unconstrained_Integer_Array := V_Arr(V_Arr'First+1..V_Arr'Last-1); --A lo python
   --
   --     type T_Dia_Semana is (E_Lunes, E_Martes, E_Miercos, E_Jueves, E_Viernes, E_Sabado, E_Domingo);
   --
   --     V_Dias_In_English : array (T_Dia_Semana) of String(1..3) := ("Mon","Tue","Wed","Thu","Fri", "Sat", "Sun");
   --
   --  begin
   --     --for I of V_Arr loop
   --     --for I of V_Pedacito_Arr loop
   --     --   Put_Line(I'Image);
   --     --end loop;
   --
   --     for Dia in T_Dia_Semana loop
   --        --Put_Line(Dia'Image);
   --        --Recordamos que los String son arrays unconstrained
   --        declare
   --           V_Dia : String := Dia'Image;
   --        begin
   --           --Slices
   --           Put_Line(V_Dia(3..V_Dia'Last) & "(" & V_Dias_In_English(Dia) & ")" );
   --        end;
   --
   --     end loop;
   --
   --  end;

   --Ejemplo 5 : Usando nuestra propia libreria
   declare
      use Consola;
      V_Entada : Integer;
   begin
      --  Put_Line("Ingrese Algo");
      --  declare
      --     --V_Algo : String := Get_Line;
      --     V_Algo : String := F_Get_Line_Not_Empty;
      --  begin
      --     if F_Es_Numero(V_Algo) then
      --        Put_Line("Es un numero");
      --     else
      --        Put_Line("No es un numero");
      --     end if;
      --  end;
      Put_Line("Ingrese un numero");
      V_Entada := F_Get_Integer;
      Put_Line("Usted Ingreso " & V_Entada'Image);
   end;


end Main;
