with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Generic_Methods; use Generic_Methods;
with Ada.Integer_Text_IO;

procedure Main is

   type Metros is new Integer;
   type DiasSemana is (Lunes,Martes,Miercoles,Jueves,Viernes,Sabado,Domingo);

   --  generic
   --     --type T is private; --Tipos No Limitados, Definidos (Longitud Fija)
   --     type T(<>) is private; --Tipos No Limitados, Tambien Indefinidos (Longitud Vairiable)
   --     --type T is (<>); --Solo tipos discreto
   --     --type T is range <>;
   --  procedure Generic_Swap(A : in out T; B : in out T);

   --  procedure Generic_Swap(A : in out T; B : in out T) is
   --     Lag : T := B;
   --     --Aux : T; --Esta linea no es valida porque t es de longingud variable/indefinido. Como no te deja S : String;
   --  begin
   --     B := A;
   --     A := Lag;
   --  end Generic_Swap;

   --  procedure Swap is new Generic_Swap(T => Integer);
   --  procedure Swap is new Generic_Swap(T => Metros);
   --  procedure Swap is new Generic_Swap(T => DiasSemana);
   --  procedure Swap is new Generic_Swap(T => Float);
   --  procedure Swap is new Generic_Swap(T => Unbounded_String);
   --  procedure Swap is new Generic_Swap(T => String);

   procedure Swap is new Generic_Swap(Integer);
   procedure Swap is new Generic_Swap(Metros);
   procedure Swap is new Generic_Swap(DiasSemana);
   procedure Swap is new Generic_Swap(Float);
   procedure Swap is new Generic_Swap(Unbounded_String);
   procedure Swap is new Generic_Swap(String);


   --procedure Swap(A : in out Integer; B : in out Integer) is
   --   Lag : Integer := B;
   --begin
   --   B := A;
   --   A := Lag;
   --end Swap;

   --procedure Swap(A:in out Metros;B:in out Metros) is
   --   Lag: Metros := B ;
   --begin
   --   B := A;
   --   A := Lag;
   --end Swap;

   --procedure Swap(A:in out DiasSemana;B:in out DiasSemana) is
   --   Lag: DiasSemana := B ;
   --begin
   --   B := A;
   --   A := Lag;
   --end Swap;

   --procedure Swap(A:in out Float;B:in out Float) is
   --   Lag: Float := B ;
   --begin
   --   B := A;
   --   A := Lag;
   --end Swap;

  --procedure Swap(A:in out String;B:in out String) is
  --   Lag: String := B ;
  -- begin
  --    B := A;
  --    A := Lag;
  -- end Swap;

   --procedure Swap(A:in out Unbounded_String;B:in out Unbounded_String) is
   --   Lag: Unbounded_String := B ;
   --begin
   --   B := A;
   --   A := Lag;
   --end Swap;

   A : Integer := 10;
   B : Integer := 20;

   AP : Positive := 30; --Positiv es subtype de Integer
   BP : Positive := 40;

   AM : Metros := 100;
   BM : Metros := 200;

   AD : DiasSemana := Lunes;
   BD : DiasSemana := Viernes;

   AF : Float := 33.33;
   BF : Float := 44.44;
begin
   Put_Line(A'Image & "  " & B'Image);  -- 10   20
   Swap(A,B);
   Put_Line(A'Image & "  " & B'Image);  -- 20   10

   --Funciona tabien
   Put_Line(AP'Image & "  " & BP'Image);  -- 10   20
   Swap(AP,BP);
   Put_Line(AP'Image & "  " & BP'Image);  -- 20   10

   Put_Line(AM'Image & "  " & BM'Image);  -- 10   20
   Swap(AM,BM);
   Put_Line(AM'Image & "  " & BM'Image);  -- 20   10

   Put_Line(AD'Image & "  " & BD'Image);  -- 10   20
   Swap(AD,BD);
   Put_Line(AD'Image & "  " & BD'Image);  -- 20   10

   Put_Line(AF'Image & "  " & BF'Image);  -- 10   20
   Swap(AF,BF);
   Put_Line(AF'Image & "  " & BF'Image);  -- 20   10

   declare
      AS1 : String := "Hola";
      BS1 : String := "Chau";
   begin
      Put_Line(AS1 & "  " & BS1);  -- 10   20
      Swap(AS1,BS1);
      Put_Line(AS1 & "  " & BS1);  -- 20   10
   end;

   declare
      AS1 : String := "Holaaaa";
      BS1 : String := "Chau";
   begin
      Put_Line(AS1 & "  " & BS1);  -- 10   20
      Swap(AS1,BS1);
      Put_Line(AS1 & "  " & BS1);  -- 20   10
   exception
      when others => Put_Line("Opa... no es tan facil porque tienen distinto tamaño");
   end;

   declare
      AS1 : Unbounded_String := To_Unbounded_String("Holaaaa");
      BS1 : Unbounded_String := To_Unbounded_String("Chau");
   begin
      Put_Line(To_String(AS1) & "  " & To_String(BS1));  -- 10   20
      Swap(AS1,BS1);
      Put_Line(To_String(AS1) & "  " & To_String(BS1));  -- 20   10
   end;

end Main;
