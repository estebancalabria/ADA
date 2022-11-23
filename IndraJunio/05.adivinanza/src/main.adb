with Ada.Numerics.Float_Random;
with Ada.Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;
with JuegoSettings;

procedure Main is
   use Ada.Numerics.Float_Random;
   use Ada.Text_IO;
   use JuegoSettings;

   --type EnteroEntre1y100 is range 1..100;
   type Intentos is range 1..5;



   Semilla : Generator;
   Azar : Uniformly_Distributed;
   NumeroSecreto : EnteroEntre1y100;
   NumeroElegido : EnteroEntre1y100;
   IntentoActual : Intentos;

begin
   --  Ejemplo 1: Que la computadora me determine un numero al azar entre 1 y 100
   Reset(Semilla);
   Azar := Random(Semilla);
   NumeroSecreto := EnteroEntre1y100((Azar * 99.0) + 1.0);
   --Ejemplo 2: Pruebo mostrando 20 numeros al azar
   --  For I in 0..20 loop
   --     NumeroSecreto := EnteroEntre1y100((Random(Semilla) * 99.0) + 1.0);
   --     Put_Line(NumeroSecreto'Image);
   --  end loop;

   --Ejemplo 3 : Que el usuario elija un numero entre 1 y 100
   --Put_Line("Ingrese un numero entre 1 y 100 para adivinar el numero secreto");
   --NumeroElegido := Get_EnteroEntre1y100;

   --Ejemplo 4 - Decir si el numero secreto es mayor, menor o igual al numero elegido
   --  if NumeroElegido > NumeroSecreto then
   --     Put_Line("El numero a adivinar es menor");
   --  elsif NumeroElegido < NumeroSecreto then
   --     Put_Line("El numero a adivinar es mayor");
   --  elsif NumeroElegido = NumeroSecreto then
   --     Put_Line("Ha acertado");
   --  end if;

   --Ejemplo 5 : con un loop que se ejecute lo anterior una cantidad fija de oportunidades (5)
   --            Se sale del loop cuando se supera la cantidad de oportunidades (extit when...)

   --            Tambien se sale del loop cuando se adivino el numero secreto
   IntentoActual := 1;
   loop
      Put_Line("Ingrese un numero entre 1 y 100 para adivinar el numero secreto");
      NumeroElegido := Get_EnteroEntre1y100;

      if NumeroElegido < NumeroSecreto then
         Put_Line("El numero que busca es mayor");
      elsif NumeroElegido > NumeroSecreto then
         Put_Line("El numero que busca es menor");
      else
         Put_Line("Felicitaciones! Has adivinado el numero secreto");
      end if;

      exit when (IntentoActual = Intentos'Last) or (NumeroSecreto = NumeroElegido);

      IntentoActual := IntentoActual + 1;
   end loop;

   if (IntentoActual = Intentos'Last) and (NumeroSecreto /= NumeroElegido) then
      Put_Line("No se ha acertado el numero. El numero era " & NumeroSecreto'Image);
   end if;

end Main;
