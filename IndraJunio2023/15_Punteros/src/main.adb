with Ada.Text_IO; use Ada.Text_IO;
with Juego; use Juego;
with Utils; use Utils;

procedure Main is

   --  type Punto is record
   --        X: Integer;
   --        Y: Integer;
   --  end record;
   --
   --  type Punto_Access is access Punto;
   --  type Integer_Access is access Integer;
   --
   --
   --  Numero_A : Integer_Access := null;
   --  Numero_B : Integer_Access := new Integer;
   --
   --  Punto_A : Punto_Access := null;
   --  Punto_B : Punto_Access := new Punto'(1,2);

   --Punto_Desreferenciado : Punto;
begin
   --  Numero_A := new Integer'(29);
   --  Put_Line(Numero_A.all'Image);
   --
   --  Numero_B := Numero_A;
   --  Numero_B.all := 120;
   --  Put_Line(Numero_A.all'Image); --120
   --
   --  --Put_Line(Numero_A'Image);--No me deja Put_Line de Punteros
   --  --Punto_Desreferenciado := Punto
   --  Punto_A := new Punto'(x=>25, y=>30); --Sintaxis (a =>  32, b => "sds, c => 323);
   --  Punto_A.X := 45;  --Lo desreferencia automaticamente
   --  Put_Line(Punto_A.X'Image & "    "  & Punto_A.Y'Image);
   --
   --  --  Insert code here.
   --  declare
   --     type Dias_Semana is (Lunes,Martes,Miercoles,Jueves,Viernes,Sabado,Domingo);
   --     type String_Access is access String;
   --     type Array_String_Dias_Semana is array (Dias_Semana) of String_Access;
   --
   --     S1 : String_Access := new String'("Hola");
   --     S2 : String_Access := new String'("Como Estas");
   --     Dia : Dias_Semana;
   --     Dias_Ingles : Array_String_Dias_Semana :=
   --       (Lunes => new String'("Monday"),
   --        Martes => new String'("Tuesday"),
   --        Miercoles => new String'("Wednesday"),
   --        Jueves => new String'("Thrusday"),
   --        Viernes => new String'("Friday"),
   --        Sabado => new String'("Saturday"),
   --        Domingo => new String'("Sunday"));
   --
   --
   --     function Prompt_Dia_Semana
   --       (V_MSG : String := "Introduzca dia semana: ";
   --        V_MSG_ERROR : String := "ERROR. No es un dia de la semana") return Dias_Semana is
   --        V_DIA : Dias_Semana;
   --     begin
   --        loop
   --           begin
   --              Put_Line (V_MSG);
   --              V_DIA := Dias_Semana'Value (Get_Line);
   --              exit;
   --           exception when others => Put_Line (V_MSG_ERROR);
   --           end;
   --        end loop;
   --        return V_DIA;
   --     end Prompt_Dia_Semana;
   --  begin
   --     Put_Line(S1.all);
   --     Dia := Prompt_Dia_Semana;
   --     Put_Line("Today is " & Dias_Ingles(Dia).all);
   --  end;
   declare
      --  function Prompt_Clase
      --    (V_MSG : String := "Introduzca la clase del Jugador: ";
      --     V_MSG_ERROR : String := "ERROR. No es uno de los tipos posibles") return Clase is
      --     V_Clase : Clase;
      --  begin
      --     loop
      --        begin
      --           Put_Line(V_MSG);
      --           V_Clase := Clase'Value(Get_Line);
      --           exit;
      --        exception when others => Put_Line(V_MSG_ERROR);
      --        end;
      --     end loop;
      --     return V_Clase;
      --  end Prompt_Clase;
      --
      --  function Prompt_Fuerza
      --    (V_MSG : String := "Introduzca su fuerza: ";
      --     V_MSG_ERROR : String := "ERROR. Debe introducir un número dentro del rango para la fuerza.") return Fuerza is
      --  begin
      --     loop
      --        begin
      --           Put_Line (V_MSG);
      --           return Fuerza'Value(Get_Line);
      --        exception when others => Put_Line (V_MSG_ERROR);
      --        end;
      --     end loop;
      --  end;
      --
      --  function P_PROMPT_HP
      --    (V_MSG : String := "Introduzca su vida: ";
      --     V_MSG_ERROR : String := "ERROR. Debe introducir un número dentro del rango para la vida.") return Vida is
      --  begin
      --     loop
      --        begin
      --           Put_Line(V_MSG);
      --           return Vida'Value(Get_Line);
      --        exception when others => Put_Line(V_MSG_ERROR);
      --        end;
      --     end loop;
      --  end P_PROMPT_HP;

      function Prompt_Clase is new Generic_Prompt(T=>Clase);
      function Prompt_Fuerza is new Generic_Prompt(T=>Fuerza);
      function  P_PROMPT_HP  is new Generic_Prompt(T => Vida);

      J : Jugador := Crear("Kratos");
   begin
      Set_Clase(J, Prompt_Clase("Ingrese Clase"));
      Set_Fuerza(J, Prompt_Fuerza("Ingrese Fuerza"));
      Set_Hp(J, P_PROMPT_HP("Ingrese Vida"));
      Mostrar(J);
   end;


end Main;
