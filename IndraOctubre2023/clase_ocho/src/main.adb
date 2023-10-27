with Q_Generic_Utils; use Q_Generic_Utils;
with Consola; use Consola;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors

procedure Main is


   type T_Metros_Por_Segundo is new Positive;

   procedure P_Swap is new P_Generic_Swap (T => Integer);
   procedure P_Swap is new P_Generic_Swap (T => Float);
   procedure P_Swap is new P_Generic_Swap (T => T_Metros_Por_Segundo);

   --No funciona porque String no es definitive (Los string requieren inicializacion)
   --procedure P_Swap is new P_Generic_Swap (T => String);
   procedure P_Swap is new P_Generic_Non_Definitive_Swap (T_Must_Initialize => String);  --Con el tema de funciona si son de la misma longitud

   function F_Return_Me(V_S:String) return String is
   begin
      Return V_S;
   end;


   --function F_Prompt is new F_Generic_Prompt(T=>Integer, Cast_To_Type => Integer'Value);
   --function F_Prompt is new F_Generic_Prompt(T=>Unbounded_String, Cast_To_Type => To_Unbounded_String);
   function F_Prompt is new F_Generic_Non_Definitive_Prompt(T_Non_Definitive=>String, Cast_To_Type => F_Return_Me);
   --Este generico admite tanto tipos Denitive como Non-Definitive
   function F_Prompt is new F_Generic_Non_Definitive_Prompt(T_Non_Definitive=>Unbounded_String, Cast_To_Type => To_Unbounded_String);
   --function F_Prompt is new F_Generic_Non_Definitive_Prompt(T_Non_Definitive=>Integer,
   --                                                         Cast_To_Type => Integer'Value);

   --V_A : Integer := F_Prompt;         --El integer es un tipo no que requiere inicializacion
   --V_B : Integer := F_Prompt;

   --Discreto = integer o enum o mod

   Type T_Dias is (Lunes, Martes, Miercoles, Jueves, Viernes);
   --Type T_Pares_Entre_1_y_10 is range 1..10 with Static_Predicate => T_Pares_Entre_1_y_10 in 2| 4 |6| 8 |10 ;

   function F_Prompt is new F_Generic_Discrete_Prompt(T_Dias);
   function F_Prompt is new F_Generic_Discrete_Prompt(T_Discrete => Integer);
   --function F_Prompt is new F_Generic_Discrete_Prompt(T_Discrete => T_Pares_Entre_1_y_10);

   --V_Unbounded :Unbounded_String := F_Prompt;
   V_Dias : T_Dias := F_Prompt;
   V_Integer : Integer;
begin
   Put_Line("Ingresaste " & V_Dias'Image);
   --Put_Line(V_A'Image & "  " & V_B'Image);
   --P_Swap(V_A,V_B); -- en python podemos hacer (A,B) = (B,A)
   --Put_Line(V_A'Image & "  " & V_B'Image);

   --Put_Line(To_String(V_Unbounded));
end Main;
