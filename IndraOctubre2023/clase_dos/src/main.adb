with ADA.Text_IO; use ADA.Text_IO;
with ADA.Float_Text_IO;


procedure Main is
  --Bloque declarativo
begin
   ---- Ejercicio 1 : El forr (iterativas)
   --Opcion 1 : For convencional
   --  For I in 1..10 loop
   --     Put_Line(I'Image);
   --  end loop;
   --
   --  New_Line;
   --
   --  --Opcion 2 : For revertido
   --  For I in reverse 1..10 loop
   --     Put_Line(I'Image);
   --  end loop;

   ----Ejercicio 2 : Loop Convencional
   --  declare
   --     I : Positive;  --Bienve idos al tipo positive
   --                    --Otro tipo de dato discreto
   --  begin
   --     I := 1;
   --     Loop
   --        Put_Line(I'Image);
   --        exit when (I=5);  --La condicion de corte
   --        I := I + 1;
   --     End Loop;
   --     Put_Line("Fin del Ciclo");
   --  end;

   ---- Ejercicio 3 : El while
   --  declare
   --     I : Positive := 1;
   --  begin
   --     while (I<=5) loop
   --        Put_Line(I'Image);
   --        I := I + 1;
   --     end loop;
   --  end;

   -- Ejericio 4 : Arreglo
   --  declare
   --     Numeros : Array (1..5) of Integer; --Declaro 5 variables de una
   --     --Sin_Elementos : Array (1..0) of Integer; --Array vacio sin Elementos
   --  begin
   --     --Put_Line("El array vacio tiene #elementos" & Sin_Elementos'Length'Image);
   --     --New_Line;
   --
   --     Numeros := (10,30,20,50,100); --Lo que en java, python, c y c++ es [] aca es el ()
   --
   --     Put_Line("Recorro el array de numeros con un for con rango harcodeado");
   --     --No es muy recomendable porque el rango esta "hardcodeado"
   --     for I in 1..5 loop
   --        Put_Line( Numeros(I)'Image );
   --     end loop;
   --
   --     New_Line;
   --
   --     Put_Line("Recorro el array de numeros con un for con rango obtendo del array (mucho mejor)");
   --     --Mucho mejor!!
   --     for I in Numeros'Range loop
   --        Put_Line( Numeros(I)'Image );
   --     end loop;
   --
   --     New_Line;
   --
   --     Put_Line("Otra forma con un for con rango obtendo del array (Tambien mejor)");
   --     for I in Numeros'First..Numeros'Last loop
   --        Put_Line( Numeros(I)'Image );
   --     end loop;
   --
   --     New_Line;
   --
   --     Put_Line("Recorro con un foreach (Lo optimo!!!!)");
   --     for Numero of Numeros loop
   --        Put_Line( Numero'Image );
   --     end loop;
   --  end;

   --Ejercicio 5 : Mostrar la sumatoria de los elementos del arreglo Numeros
   --  declare
   --     Numeros : array (1..5) of Integer := (32,43,54,64,65);
   --     Acumulador : Integer := 0;
   --  begin
   --     for Numero of Numeros loop
   --        Acumulador := Acumulador + Numero;
   --     end loop;
   --     Put_Line("La suma es:" & Acumulador'Image);
   --  end;
   --
   --  --Ejercicio 6 : Buscar el elemento mayor del arreglo
   --  declare
   --     Numeros : array (2..6) of Integer := (32,43,54,64,65);
   --
   --     -- No me gusta mucho que el Mayor empiece con cero
   --     --Me peta si el arreglo tiene todos numeros negativos
   --     --Mayor : Integer := 0;
   --
   --    Mayor : Integer; --No la inicializo
   --  begin
   --     Put_Line("Buscando el mayor elemento del arreglo");
   --
   --     If Numeros'Length = 0 then
   --        Put_Line("El array esta vacio, no se puede determinar el mayor");
   --     else
   --        --Put_Line(Integer'Last'Image); --El Integer mas grande que podemos almacenar en 32 bits
   --
   --        --Mayor := Numeros(Numeros'First);  --Lo Incializo con el primer elemento
   --        Mayor := Integer'First; --Tambien lo puedo incializr con entero mas chicos
   --
   --        for Num of Numeros loop
   --           if(Num > Mayor) then
   --              Mayor := Num;
   --           end if;
   --        end loop;
   --        Put_Line("Mayor: " & Mayor'Image);
   --     end if;
   --  end;

   --Ejercicio 7 : Puntos flotantes
   --  declare
   --     use Ada.Float_Text_IO;
   --     Punto_Flotante : Float;
   --  begin
   --     --Punto_Flotante := 10;  --No es una asignacion valida
   --     Punto_Flotante := 10.757789;
   --     --Punto_Flotante := Float(10); --Otra manera
   --
   --     --Me lo muestra en notacion cientifica
   --     --Put_Line(Punto_Flotante'Image);
   --
   --     --Esta sobrecarga esta en Ada.Float_Text_IO
   --     --Lo sigue mostrando en notacion cientifica
   --     --Put(Punto_Flotante);
   --
   --     --Fore (Cuantos espacion dejo antes
   --     Put(Punto_Flotante, Fore => 0, Aft => 0, Exp => 0);
   --     --Es lo mismo que...
   --     --Put(Punto_Flotante, 0, 0, 0);
   --  end;

   --Ejercicio 8 : un par de cositas del if
   --  declare
   --     Numero : Integer := 4;
   --  begin
   --
   --     -- El | es el "choice operator", ojo que en java, python, c, c# el | es el or
   --     if (Numero in 2|4|6|8|10) then
   --        Put_Line("Es numero par menor igual que 10");
   --     end if;
   --
   --
   --     Numero := -10;
   --     if not(Numero in Positive) then
   --        Put_Line("Ahora, el numero no es positvo");
   --     end if;
   --
   --     -- distinto /=
   --     if (Numero>0) and (Numero /= 3) then
   --        Put_Line("El numero no es 3");
   --     end if;
   --  end;
   --

   --Ejercicio 9 : El case
   --  declare
   --     --Esto en ADA NO SE HACE
   --     --En ADA Se utilizan los tipos de datos Primitivos para definir otros tipos de datos
   --     --Nota : Integer;
   --
   --     --En su lugar...
   --     type T_Nota is range 1..10;
   --     Nota : T_Nota;
   --  begin
   --     Put_Line("Ingrese su nota de examen de 1 a 10");
   --     --Nota := Integer'Value(Get_Line);
   --     Nota := T_Nota'Value(Get_Line);  --Valida no solo que sean numero sino ademas que vayan de 1 a 10
   --
   --     case Nota is
   --        when 1 =>
   --           Put_Line("Insuficiente");
   --           Put_Line("Usted se ha copiado");
   --        when 2|3|4 => Put_Line("Reprobado");
   --        when 5..7 => Put_Line("Aprobado");
   --        when 8|9 => Put_Line("Destacado");
   --        --when 8 or 9 => Put_Line("Destacado"); esto NO funciona
   --        when 10 => Put_Line("Sobresaliente");
   --        when others => Put_Line("Nota Incorrecta");
   --     end case;
   --
   --     --Repaso Expresiones If (Una expresion es algo que hace un calculo y devuelve un valor)
   --     declare
   --        Incentivo : String := (if Nota<8 then "Hay que seguir esforzandose" else "Siga asi");
   --     begin
   --        Put_Line(Incentivo);
   --     end;
   --
   --     --Expresiones Case
   --     --Las opciones van separadas por , en vez de ;
   --     Put_Line(case Nota is
   --                 when 1 => "Insuficiente (Copia)" ,
   --                 when 2|3|4 =>"Reprobado",
   --                 when 5..7 => "Aprobado",
   --                 when 8|9 => "Destacado",
   --                 when 10 => "Sobresaliente",
   --                 when others => "Nota Incorrecta");
   --
   --     --Otra forma de hacer un if
   --     if (Nota in 8..10) then
   --        Put_Line("Usted es un muy buen alumno");
   --     end if;
   --
   --
   --  exception
   --     when others => Put_Line("No ha ingresado una nota correcta");
   --  end;

   --Ejercicio 10 : Subprogramas (Procedimientos)
   --  declare
   --     type T_Nota is range 1..10;
   --
   --     procedure P_Saludar is
   --     begin
   --        Put_Line("Saludos Terricola");
   --     end P_Saludar; --Opcionalmente se puede repetir el nombre del metodo
   --
   --     --Lo Sobrecargo
   --     --procedure P_Saludar(Nombre : String) is
   --     procedure P_Saludar(Nombre : in String) is  --Por defecto los parametros son de entrada con in, el in es opcional
   --     begin
   --        Put_Line("Saludos " & Nombre);
   --     end;
   --
   --     procedure P_Mostrar(Nota:T_Nota) is
   --     begin
   --        Put_Line(Nota'Image);
   --     end P_Mostrar;
   --
   --     procedure P_Mostrar(Valor:Integer) is
   --     begin
   --        Put_Line(Valor'Image);
   --     end P_Mostrar;
   --
   --     procedure P_Inc(Valor : in out Integer) is
   --     begin
   --        Valor := valor + 1;
   --     end;
   --
   --     procedure P_Inc(Input : in Integer; Output: out Integer) is
   --     begin
   --        Output := Input + 1;
   --     end P_Inc;
   --
   --     procedure P_Intercambiar(A : in out Integer; B: in out Integer) is
   --        V_Aux : Integer;
   --     begin
   --        V_Aux := A;
   --        A := B;
   --        B := V_Aux;
   --     end P_Intercambiar;
   --
   --
   --
   --     Nota : T_Nota := 3;
   --     Numero : Integer;
   --     Numero_Dos : Integer;
   --  begin
   --     --  P_Saludar;
   --     --  P_Saludar("Esteban");
   --     --  P_Saludar(Nombre => "Juan"); --Invocando con parametros con nombre
   --     --
   --     --
   --     --  --P_Mostrar(3); --No sabe que sobrecarga mostrar porque es ambiguo. Requiere casteo
   --     --  P_Mostrar(T_Nota(3)); --Tengo que castear
   --     --  P_Mostrar(Nota);      --O Usar una variable
   --     --
   --     --  --P_Inc(3); --No me deja, como el parametro es out tengo que pasar una variable
   --     --  New_Line;
   --     --  Numero := 4;
   --     --  P_Mostrar(Numero);
   --     --  P_Inc(Numero);
   --     --
   --     --  New_Line;
   --     --  P_Inc(10, Numero);
   --     --  P_Mostrar(Numero);
   --     --  P_Inc(Numero, Numero);
   --     --  P_Mostrar(Numero);
   --
   --     New_Line;
   --     Numero := 100;
   --     Numero_Dos := 200;
   --     P_Mostrar(Numero);
   --     P_Mostrar(Numero_Dos);
   --
   --     Put_Line("...Intercambio..");
   --     P_Intercambiar(Numero, Numero_Dos);
   --
   --     P_Mostrar(Numero);
   --     P_Mostrar(Numero_Dos);
   --  end;

   --Ejercicio 11 : Funciones
   declare

      function F_Uno return Integer is
      begin
         return 1;
      end F_Uno;

      function F_Siguiente_De(Valor: Integer) return Integer is
      begin
         return Valor+1;
      end;

      function F_Siguiente_De(Valor: Integer) return String is
         Aux : Integer := Valor + 1;
      begin
         --Valor := Valor+1 --No me deja porque es un parametro in
         return Aux'Image;
      end;



      V_Numero : Integer;

   begin
      --F_Uno; --No me deja llamar a una funcion si no uso el valor de retorno
      V_Numero := F_Uno; --Como la funcion no tiene parametros no van ()
      Put_Line(V_Numero'Image);
      Put_Line(F_Uno'Image); --Tambien se puede

      New_Line;
      --ADA es el unico lenguaje que sabe que funcion invocar dependiendo elvv valor de retorno
      V_Numero := F_Siguiente_De(5); --ADA es el unico lenguaje que sabe que funcion invocar dependiendo elvv valor de retorno
      Put_Line(V_Numero'Image);
      declare
         V_Numero_String : String := F_Siguiente_De(6);
      begin
         Put_Line(V_Numero_String);
      end;


   end;



   New_Line;
   Put_Line("Fin del programa");
end Main;

