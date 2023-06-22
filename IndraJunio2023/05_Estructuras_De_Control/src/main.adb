with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;
--with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is

   type Metros_Por_Segundo is new Float;
   type Segundos is new Float;
   type Metros is new Float;
   type Kilometros is new Float;


   function Prompt
     (Mensaje:String := "Ingrese un String";
      Error_String_Vacio:String := "Ha Ingresado un string vacio... vuelva a intentar") return String is

      use Ada.Strings.Fixed;
   begin

      Put_Line(Mensaje);
      loop
         declare
            Entrada: String := Trim(Get_Line, Ada.Strings.Both);
         begin
            if Entrada'Length > 0 then
               return Entrada;  --Alguno los discutirian
            end if;
            --Put_Line("Ha Ingresado un string vacio... vuelva a intentar"); --Hardcoded String
            Put_Line(Error_String_Vacio);
         end;
      end loop;
   end Prompt;

   function Prompt
     (Mensaje:String := "Ingrese un String";
      Error_Entrada_Incorrecta:String := "No ha ingresado un numero") return Metros_Por_Segundo is

      Entrada : Metros_Por_Segundo;
      Entrada_Correcta : Boolean := false; --Variable explicativa
   begin
      Put_Line(Mensaje);

      while (not Entrada_Correcta) loop
         begin
               Entrada := Metros_Por_Segundo'Value(Get_Line);
               Entrada_Correcta := True;
         exception
            when others =>
               Put_Line(Error_Entrada_Incorrecta);
               Entrada_Correcta := False;
         end;
      end loop;

      return Entrada;
   end;

   --Por ahora lo copio porque tovavia no vi algunos temas....
   function Prompt
     (Mensaje:String := "Ingrese un String";
      Error_Entrada_Incorrecta:String := "No ha ingresado un numero") return Segundos is

      Entrada : Segundos;
      Entrada_Correcta : Boolean := false; --Variable explicativa
   begin
      Put_Line(Mensaje);

      while (not Entrada_Correcta) loop
         begin
               Entrada := Segundos'Value(Get_Line);
               Entrada_Correcta := True;
         exception
            when others =>
               Put_Line(Error_Entrada_Incorrecta);
               Entrada_Correcta := False;
         end;
      end loop;

      return Entrada;
   end;

   function "*" (Velocidad:Metros_Por_Segundo; Tiempo:Segundos) return Metros is
   begin
      return Metros(Velocidad) * Metros(Tiempo);
   end;

   function "+" (M:Metros) return Kilometros is
   begin
      return Kilometros(M / 1000.0);
   end;


begin
   declare
      --Nombre_Movil : String := Prompt_String("Como se llama el movil?");
      Nombre_Movil : String := Prompt(Mensaje => "Como se llama el movil?");
      --Nombre_Movil : String := Prompt_String; --Utilizo el valor por defecto del parametro

      Velocidad_Movil : Metros_Por_Segundo := Prompt("A que velocidad va? (Metros Por Segundo)");
      Tiempo_Transcurrido : Segundos := Prompt("Cuantos tiempo transcurrio? (Segundos)");

      --Distancia : Metros := Velocidad_Movil * Tiempo_Transcurrido;  --Asi como esta no funciona;
      --Distancia : Metros := Metros(Velocidad_Movil) * Metros(Tiempo_Transcurrido);  --Asi como esta no funciona;
      Distancia_Metros : Metros := Velocidad_Movil * Tiempo_Transcurrido;  --ahora funciona porque sobrecargue el *
      Distancia_Kilometros : Kilometros := 0.0;

      --A : Integer := -5;
   begin
      --A := +A;
      --Put_Line(A'Image);  --Muestra -5

      Distancia_Kilometros := +Distancia_Metros;
      --Put_Line("Se Ha Recorrido " & Distancia'Image & " metros");
      Put("Se Ha Recorrido ");
      Put(Float(Distancia_Metros), Fore =>  0, Aft => 4, Exp => 0);
      Put( " metros");
      New_Line;
      Put("Se Ha Recorrido ");
      Put(Float(Distancia_Kilometros), Fore =>  0, Aft => 4, Exp => 0);
      Put( " kilometros");
      New_Line;

      --En vez de mostrar por pantalla primero lo guardo en un string (si entra)
      declare
         --Float_As_String : String := Get_Line; --Primero ejecuto el get_line para saber cuanta memoria reservar
         Float_As_String : String(1..200);
      begin
         Put(Float_As_String, Float(Distancia_Kilometros), Aft => 4, Exp => 0);
         Put_Line(Float_As_String);
      end;

   end;
end Main;
