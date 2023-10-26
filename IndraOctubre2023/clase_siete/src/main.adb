with Ada.Text_IO; use Ada.Text_IO;
with Q_Figura; use Q_Figura;
with Q_Test_Containers;

procedure Main is

begin
   --Q_Test_Containers.P_Test_Ordered_Map;
   --Q_Test_Containers.P_Test_Contar_Palabras("hola que tal hola hola");
   --que aparece 1 vez
   --tal aparcece 1 vez
   --hola aparece 3 veces

   declare
      V_Figura:T_Tagged_Figura := F_Crear_Figura(23,3);
   begin
      Set_Base(V_Figura, 10);
      Set_Altura(V_Figura, 20);
      Put_Line("Base " & Get_Base(V_Figura)'Image);
      Put_Line("Altura " & Get_Altura(V_Figura)'Image);

      --En Java Escribiriamos (O en ADA con tagged record)
      V_Figura.Set_Base(10);
      V_Figura.Set_Altura(20);
      Put_Line("Base " & V_Figura.Get_Base'Image);
      Put_Line("Altura " & V_Figura.Get_Altura'Image);
   end;


   --  declare
   --     V_Figura : T_Figura := F_Crear_Figura(10,10);
   --     V_Otra_Figura : T_Figura := F_Crear_Figura(10,10);
   --     --V_Figura_Sin_Inicializar : T_Figura; --(Mas alla del warning) me permite variables sin inicializar
   --
   --     V_Figura_Limitada : T_Limited_Figura := F_Crear_Figura(20,20);
   --     --V_Figura_Limitada_Sin_Inicializar : T_Limited_Figura; --(Mas alla del warning) me permite variables sin inicializar
   --     --V_Otra_Figura_Limitada := V_Figura_Limitada; --Esto no funciona porque son tipos limitados=
   --
   --     --V_Figura_Inicializada : T_Figura_Requiere_Inicializacion; --No me deja
   --     V_Figura_Inicializada : T_Figura_Requiere_Inicializacion := F_Crear_Figura(23,43);
   --  begin
   --     V_Figura := V_Otra_Figura; --me deja porque si tipos non-limted
   --     if (V_Figura = V_Otra_Figura) then
   --        Put_Line("Son Iguales");
   --     end if;
   --
   --     P_Mostrar_Figura(V_Figura);
   --  end;
   --

   --  declare
   --
   --     --El operador de := no funciona para los tipos limitados
   --     --Salvo que sea para inicializarlo
   --     --V_F1 : T_Figura := (Base => 10, Altura => 10);
   --     --V_F2 : T_Figura;
   --  begin
   --     null;
   --     --V_F1.Base := 10;
   --     --V_F1.Altura := 10;
   --
   --     --Una vez que esta inicializado el operador := no va mas
   --     --V_F1 :=(Base => 10, Altura => 10);
   --
   --     --V_F2.Base := 10;
   --     --V_F2.Altura := 10;
   --
   --     --Es lo mismo que hacer
   --     --El operador asignacion no funciona para los tipos limitados
   --     --V_F1 := V_F2;  --Estoy igualando los datos o diciento que son la misma cosa?
   --
   --     --Ambas figuras son iguales?
   --     --En principio si, tienen misma base y misma altura
   --     --Dos Interpretaciones
   --     --Tengo dos figuras iguales
   --     --Tengo dos figuras distintas que tienen la misma base y  la altura
   --     --Los tipos limitados tampoco permiten el operador de comparacion
   --     --if (V_F1 = V_F2) then
   --     --   Put_Line("Son Iguales");
   --     --else
   --     --   Put_Line("Son DIstintos");
   --     --end if;
   --  end;





end Main;
