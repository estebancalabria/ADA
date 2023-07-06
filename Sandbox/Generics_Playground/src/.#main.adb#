with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   --Definicion Metodo Generico
   generic
      --type T is private;               --  nonlimited definitive type : Asignacion permitida, Declaracion sin inicializacion permitida
      --type T is limited private;
      type T(<>) is private;             --  nonlimited indedefinitive type : Asignacion permitida, Declaracion solo con inicializacion
      --type T(<>) is limited private;   --  limited : Asignacion no permitida, inicializacion con funcion
   procedure Generic_Swap(A:in out T; B:in out T);

   --Implementacion Metodo Generico
   procedure Generic_Swap(A: in out T; B: in out T) is
      Aux : T := A;
   begin
      A := B;
      B := Aux;
   end;

   generic
      type T is private;
      with function Convert(Entrada:String) return T;
   function Generic_Scalar_Prompt(Mensaje:String := "Ingrese un valor") return T;

   function Generic_Scalar_Prompt(Mensaje:String := "Ingrese un valor") return T is
   begin
      Put_Line(Mensaje);
      loop
         declare
            Result : T;
         Begin
            Result := Convert(Get_Line);
            return result;
         exception
            when others => Put_Line("Error Vuelva a Ingresar");
         end;
      end loop;
   end;


  --Instanciacion Metodo Generico
   procedure Swap is new Generic_Swap(T => Integer);
   procedure Swap is new Generic_Swap(T => String);

   function Prompt is new Generic_Scalar_Prompt(T => Integer, Convert => Integer'Value);
   function Prompt is new Generic_Scalar_Prompt(T => Float, Convert => Float'Value);

   N1 : Integer := 2;
   N2 : Integer := 4;

   S1 : String := "Hola";
   S2 : String := "Chau";
begin
   Put_Line(N1'Image & "  " & N2'Image);
   Swap(N1, N2);
   Put_Line(N1'Image & "  " & N2'Image);



   --  Insert code here.
   Put_Line(S1 & "  "  & S2);
   Swap(S1,S2);
   Put_Line(S1 & "  "  & S2);
   null;
end Main;
