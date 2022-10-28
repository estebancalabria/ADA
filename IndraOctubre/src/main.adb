with Ada.Text_IO; use Ada.Text_IO;
with Generic_Demo; use Generic_Demo;

procedure Main is
   Default_Max_Jugadores : constant Integer := 23;
   Default_Min_Jugadores : constant Integer := 11;

   type Equipos is (Real_Madrid, Barsa, Betis, Villareal, Getafe, Atletico);
   type Cantidad_Jugadores is new Integer range Default_Min_Jugadores..Default_Max_Jugadores;
   type Sueldo is range 0..2**40;
   type Metros_Sobre_Segundos is delta 0.001 digits 4;

   C1 : Cantidad_Jugadores;
   C2: Cantidad_Jugadores;

   Equipo_Favorito : Equipos;
   Equipo_Odiado : Equipos;

   NumeroA  : Natural;
   NumeroB : Natural;

   Sueldo_Messi : Sueldo;
   Sueldo_Tesla :Sueldo;

   --Velocidad_Inicial : Metros_Sobre_Segundos;
   --Velocidad_Final : Metros_Sobre_Segundos;

   --Swap de Cantidad Jugadores
   --  procedure Swap(Can1 : in out Cantidad_Jugadores;
   --                 Can2 : in out Cantidad_Jugadores) is
   --     Aux : Cantidad_Jugadores;
   --  begin
   --     Aux := Can1;
   --     Can1 := Can2;
   --     Can2 := Aux;
   --  end;
   --
   --  procedure Swap_Equipos(Team1 : in out Equipos;
   --                         Team2 : in out Equipos) is
   --     Aux : Equipos;
   --  begin
   --     Aux := Team1;
   --     Team1 := Team2;
   --     Team2 := Aux;
   --  end;
   --
   --  procedure Swap_Numeros (Entrada1: in out Integer;
   --                          Entrada2: in out Integer)   is
   --     Aux:Integer;
   --  begin
   --     Aux := Entrada1;
   --     Entrada1 := Entrada2;
   --     Entrada2 := Aux;
   --  end;

   procedure Swap is new Generic_Swap(T => Cantidad_Jugadores);
   procedure Swap is new Generic_Swap(T => Equipos);
   procedure Swap is new Generic_Swap(T => Natural);
   procedure Swap is new Generic_Swap(T => Sueldo);

begin
   C1 := 23;
   C2 := 15;
   Put_Line("("& C1'Image & "," & C2'Image &")"  );
   Swap(C1, C2);
   Put_Line("("& C1'Image & "," & C2'Image &")"  );

   --Otro Ejemplo
   Equipo_Favorito := Barsa;
   Equipo_Odiado := Real_Madrid;
   Put_Line("("& Equipo_Favorito'Image & "," & Equipo_Odiado'Image &")"  );
   --Swap_Equipos(Equipo_Favorito, Equipo_Odiado);
   Swap(Equipo_Favorito, Equipo_Odiado);
   Put_Line("("& Equipo_Favorito'Image & "," & Equipo_Odiado'Image &")"  );

   --Otro Mas
   NumeroA := 10;
   NumeroB := 20;
   Put_Line("("& NumeroA'Image & "," & NumeroB'Image &")"  );
   --Swap_Numeros(NumeroA,NumeroB);
   Swap(NumeroA,NumeroB);
   Put_Line("("& NumeroA'Image & "," & NumeroB'Image &")"  );
   null;

   Sueldo_Messi := 1000000000;
   Sueldo_Tesla := 2000000000;
   Put_Line("("& Sueldo_Messi'Image & "," & Sueldo_Tesla'Image &")"  );
   Swap(Sueldo_Messi, Sueldo_Tesla);
   Put_Line("("& Sueldo_Messi'Image & "," & Sueldo_Tesla'Image &")"  );


   --Generico
   --List<int> lista = new ArrayList<int>()
end Main;

