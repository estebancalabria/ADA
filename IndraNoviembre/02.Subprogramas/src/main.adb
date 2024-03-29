with Ada.Text_IO;use Ada.Text_IO;
with Ada.Strings.Fixed;  --No le pongo el use a proposito
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is

   --procedure Put_Nice_Line(Texto:String) is
   procedure Put_Nice_Line
     (Texto:in String;
      Subrayado : Character := '*') is
      use Ada.Strings.Fixed; --Para que sobrecargue el operador *
   begin
      Put_Line(Texto);
      Put_Line(Texto'Length * Subrayado);
   end;

   --Hacer el subprograma
   --("hola" => "aloh")
   procedure Put_Reverse_Line(Texto:in String) is
   begin
      for C of reverse Texto loop
         Put(C);
      end loop;
      Put_Line("");
   end;

   --
   --Por defecto remplaza i=>1, a=>4, e=>3, s=>5, o=>0 (Parametros por defecto)
   --Los reemplazos son configurables
   --"Hola" => "H0l4"
   procedure Put_Hacker_Line(Texto:in String; A:Character := '4';
                             E:Character := '3'; I:Character := '1';
                             O:Character := '0'; S:Character := '5') is
      use Ada.Strings.Fixed;
   begin
      for C of Texto loop
         case C is
         when 'i' | 'I' => Put(i);
         when 'a' | 'A' => Put(a);
         when 'e' | 'E' => Put(e);
         when 's' | 'S' => Put(s);
         when 'o' | 'O' => Put(o);
         when others => Put(C);
         end case;
      end loop;
      Put_Line("");
   end;

   function Area_Rectangulo(LadoMayor :in Float; LadoMenor:in Float) return Float is
   begin
      return LadoMayor * LadoMenor;
   end;

   procedure Intercambiar(A : in out Integer;
                          B : in out Integer) is
     Aux : Integer := A;
   begin
      A:=B;
      B:=Aux;
   end;
begin
   --Put_Nice_Line("Hola Subpgrogramas");
   --Put_Nice_Line("Hola Subpgrogramas",'-');
   --  Put_Nice_Line(Texto => "Hola Mundo Subpgrogramas",
   --                Subrayado => '=');  --Parametros con Nombre
   --
   --  Put_Reverse_Line("Asereje ja deje");
   --  Put_Hacker_Line("Hola que tal, Saludos");
   --  Put_Hacker_Line("Hola que tal, Saludos", O => '.');
   --
   --  declare
   --     Area : Float;
   --  begin
   --     Area := Area_Rectangulo(3.0, 5.0);
   --     Put("El Area es ");
   --     Put(Area, Exp => 0, Aft => 2);
   --     Put_Line("");
   --  end;
   --
   --  declare
   --     Primero : Integer := 10;
   --     Segundo : Integer := 20;
   --  begin
   --     Put_Line("Antes Intercambiar " & Primero'Image & " " & Segundo'Image);
   --     Intercambiar(Primero, Segundo);
   --     Put_Line("Despues Intercambiar " & Primero'Image & " " & Segundo'Image);
   --  end;

   declare
      A:Integer := 2;
      B:Integer := 3;
      Res : Integer;
      FA:Float := 7.0;
      FB:Float := 8.0;
      FRes : Float;

      --funcion que sume dos enteros y devuelva el resultado
      function Suma_Dos_Numeros(Primero : in Integer; Segundo : in Integer) return Integer is
      begin
        return Primero + Segundo;
      end;

      function Suma_Dos_Numeros(Primero : in Float; Segundo : in Float) return Float is
      begin
         return Primero + Segundo;
      end;

      function "+"(Primero : in Float; Segundo : in Integer) return Float is
      begin
         Put_Line("Estoy usando la sobrecarga del +");
         return Primero + Float(Segundo);
      end;


      procedure PrintF(Item:String) renames Put_Line;
   begin
      --Es una funcion, entonces estoy obligado a usar su valor de retorno
      Res := Suma_Dos_Numeros(A,B);
      PrintF("La suna de " & A'Image &" mas " & B'Image  & " es " & Res'Image );

      --Sobrecarga de funciones
      FRes := Suma_Dos_Numeros(FA,FB);
      Put(FA, Exp => 0);
      Put(" + ");
      Put(FB, Exp => 0);
      Put(" = ");
      Put(FRes, Exp => 0);
      Put_Line("");

      --Sumo dos tipos distintos
      --Esto no lo toma porque son tipos incompatibles
      --ADA No hace conversiones implicitas
      --FRes := A + FA;
      --FRes := Float(A) + FA;

      --SOBRECARGA DE OPERADORES!
      --Luego de sobrecargar el operador +
      --FRes := A + FA; --No, la sobrecarga es posicional
      FRes := FA + A ;
      Put(FRes, Exp=>0);
   end;
end Main;
