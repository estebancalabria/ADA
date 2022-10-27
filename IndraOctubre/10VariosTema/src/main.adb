with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is
begin
   --  declare
   --     type Nota is range 0..10 with Default_Value => 7;
   --     type Array_Numeros is array(Positive range <>) of Integer with Default_Component_Value => 10;
   --     --type Nota_Descriptiva is ("Excelente", "Muy Bueno", "Bueno", "Regular", "Malo"); --No Se puede
   --     --type Array_Numeros is array(Positive range <>) of Nota with Default_Component_Value => 10;
   --     --type Caracteres_Validos is ('A','B','C'); --Aca si
   --     --type Valores_Validos is (10,15,20,40); --Esto no se puede
   --     --Muchos_Numeros : Array_Numeros(1..15);
   --     Array_Vacio : Array_Numeros(2..1);
   --     --Muchos_Numeros : Array_Numeros := (1,3,4,5,6,7,1,3,4); --Inicializando array
   --     Muchos_Numeros : Array_Numeros(1..15) := (1=>2, 2|3|4=>7, 5=><>, others =>5); --Inicializando array con Aggregates
   --     Pedacito : Array_Numeros := Muchos_Numeros(1..4); --Array Slices
   --     Muchos_Mas_Numeros : Array_Numeros := Muchos_Numeros & Pedacito;
   --     Mi_Nota : Nota;
   --  begin
   --     --Esto tambien se puede hacer con array slices
   --     Pedacito(1..3) := Muchos_Numeros(2..4);
   --
   --     --for I in Muchos_Numeros'Range loop
   --     --for I in Pedacito'Range loop
   --     for I in Muchos_Mas_Numeros'Range loop
   --        --Put_Line(Muchos_Numeros(I)'Image);
   --        --Put_Line(Pedacito(I)'Image);
   --        Put_Line(Muchos_Mas_Numeros(I)'Image);
   --     end loop;
   --     Put_Line("");
   --     Put_Line(Mi_Nota'Image);
   --     Put_Line("El array vacio tiene longitud " & Array_Vacio'Length'Image);
   --     Put_Line("El array mas largo tiene " & Muchos_Mas_Numeros'Length'Image);
   --  end;

   --  declare
   --     type Componente_Adn is (A, G, C, T);
   --     --(Adenina, Guanina, Citosina, Timina);
      --  Componente_Adn_As_String : array (Componente_Adn) of Unbounded_String
      --    := (To_Unbounded_String("Adenina"),
      --        To_Unbounded_String("Guanina"),
      --        To_Unbounded_String("Citosina"),
      --        To_Unbounded_String("Timina"));

   --     function To_String(Enum:Componente_Adn) return String is
   --     begin
   --        return
   --          (Case Enum is
   --              when A => "Adenina",
   --              when G => "Guanina",
   --              when C => "Citosina",
   --              when T => "Timina");
   --     end;
   --
   --
   --     Componente : Componente_Adn := A;
   --
   --  begin
   --     --  Put_Line(To_String(Componente_Adn_As_String(Componente)));
   --     Put_Line(To_String(Componente));
   --  end;

   declare
      --type Dia is range 1..31;
      --type Mes is range 1...12
      type Fecha is record
         Dia : Integer range 1..31;
         Mes : Integer range 1..12;
         Año : Integer range 1900..3000;
      end record;

      Nacimiento : Fecha := (20,9,1980); --Inicializacion posicional
      Nacimiento : Fecha := (Dia => 20, Mes => 9, Año => 1980);

   begin
      Nacimiento.Dia := 20;

   end;



   null;
end Main;
