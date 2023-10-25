with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Consola;
with Q_Vector_Integer;

with Ada.Containers.Vectors;

procedure Main is

begin
   --Ejercicio 1 : Genericos
   --Q_Vector_Integer.P_Ejercicio_Vector;

   --Ejercicio 2 : Manejo de Strings
   declare
      --use Ada.Strings.Fixed;
      package Q_String_Utils renames Ada.Strings.Fixed;

      function Max(V_Num_1:Integer; V_Num_2:Integer) return Integer is
      begin
         return (if V_Num_2>V_Num_1 then V_Num_2 else V_Num_1);
      end;

      --Devuelvo un string nuevo que reemplaze todas las ocurrencias de V_Buscado
      --en V_Source por V_Reemplazo
      function F_Replace_All(V_Source : String; V_Buscado:String; V_Reemplazo:String) return String is
      begin
         declare
            Idx_Buscado : Natural := Q_String_Utils.Index(V_Source, V_Buscado);

         begin
            if Idx_Buscado = 0 then
               return V_Source;  --Caso Base
            end if;

            return V_Source(V_Source'First..Idx_Buscado-1)
                 & V_Reemplazo
                 & F_Replace_All(V_Source(Idx_Buscado + V_Buscado'Length..V_Source'Last), V_Buscado, V_Reemplazo);
         end;
      end;

      --Vimos S(), S(1..2), Trim, To_Upper, To_Lower
      V_Cadena : String := "Hola que tal como estas que tal que va que que";
      V_Cadena_Buscada : String := "que";
   begin


      Put_Line(V_Cadena);

      --Metodo Count
      declare
         V_Ocurrencias : Natural := Q_String_Utils.Count(V_Cadena, V_Cadena_Buscada);
      begin
         Put_Line("El String " & V_Cadena_Buscada
                  &" aparece " & V_Ocurrencias'Image
                  & " veces");
      end;

      --Metodo Index
      declare
         V_Posicion_Ocurrencia : Natural := Q_String_Utils.Index(V_Cadena, V_Cadena_Buscada);
      begin
         while V_Posicion_Ocurrencia /= 0 loop
            Put_Line("El String " & V_Cadena_Buscada
                     &" aparece en la posicion" & V_Posicion_Ocurrencia'Image);

            V_Posicion_Ocurrencia := Q_String_Utils.Index(V_Cadena,
                                                          V_Cadena_Buscada,
                                                          V_Posicion_Ocurrencia+1);
         end loop;
      end;

      --Metodo Replace
      declare
         V_Nueva_Cadena : constant String := "*****";
         Idx_Cadena_Buscada : Natural := Q_String_Utils.Index(V_Cadena, V_Cadena_Buscada);
      begin
         Put_Line("Reemplazo " & V_Cadena_Buscada & " por " & V_Nueva_Cadena);
         if Idx_Cadena_Buscada /= 0 then

            --Si Tienen la misma longitud
            if (V_Nueva_Cadena'Length = V_Cadena_Buscada'Length) then
               Q_String_Utils.Replace_Slice(Source => V_Cadena,
                                            Low => Idx_Cadena_Buscada,
                                            High => Idx_Cadena_Buscada + V_Nueva_Cadena'Length-1,
                                            By => V_Nueva_Cadena);
               Put_Line(V_Cadena);
            else
               declare
                  --La cadena que voy a generar tiene un length distinto
                  V_Cadena_Replazada : String := V_Cadena(1..Idx_Cadena_Buscada-1)
                    & V_Nueva_Cadena
                    & V_Cadena(Idx_Cadena_Buscada + V_Cadena_Buscada'Length.. V_Cadena'Length);
               begin
                  Put_Line(V_Cadena_Replazada);
               end;

            end if;
         end if;
      end;

      --F_Replace_All
      declare
         S1 : String := "hola hola hola hola hola";
         S2 :String := F_Replace_All(S1,"hola","chau");
      begin
         Put_Line(S2);
      end;
   end;


   --Ejercicio 3 : Strings y Vectores
   --Splice("a,b,c,d",", ",") => ["a","b","c","d"])
   declare
      --package Q_Vector_String is new Ada.Containers.Vectors
      --  (Index_Type => Positive,
      --   Element_Type => Unbounded_String);

      package Q_String_Utils renames Ada.Strings.Fixed;

      --subtype String_Vector is Q_Vector_String.Vector;
      type String_Vector is array (Positive range <>) of Unbounded_String;

      function F_Splice(V_Source:String; V_Delimiter:String) return String_Vector is
         Idx_Delimiter : Natural := Q_String_Utils.Index(V_Source, V_Delimiter);
      begin
         if (Idx_Delimiter = 0 ) then
            return (1 => To_Unbounded_String(V_Source));
         end if;

         declare
            V_SubCadena : String := V_Source(V_Source'First..Idx_Delimiter-1);
         begin
               return To_Unbounded_String(V_SubCadena)
                 & F_Splice(V_Source((Idx_Delimiter+V_Delimiter'Length)..V_Source'Last), V_Delimiter);
         end;
      end;

      S : String := "Hola que tal como andas";
      Palabras : String_Vector := F_Splice(S, " ");
   begin
      for P of Palabras loop
         Put_Line(To_String(P));
      end loop;
   end;


end Main;
