with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;


package body Q_String_Utils is

   function F_Replace_All(V_Source : String; V_Buscado:String; V_Reemplazo:String) return String is
   begin
      declare
         Idx_Buscado : Natural := Ada.Strings.Fixed.Index(V_Source, V_Buscado);
      begin
         if Idx_Buscado = 0 then
            return V_Source;  --Caso Base
         end if;

         return V_Source(V_Source'First..Idx_Buscado-1)
           & V_Reemplazo
           & F_Replace_All(V_Source(Idx_Buscado + V_Buscado'Length..V_Source'Last), V_Buscado, V_Reemplazo);
      end;
   end;
   
   function F_Split(V_Source:String; V_Delimiter:String) return String_Vector is
      Idx_Delimiter : Natural := Ada.Strings.Fixed.Index(V_Source, V_Delimiter);
   begin
      if (Idx_Delimiter = 0 ) then
         return (1 => To_Unbounded_String(V_Source));
      end if;

      declare
         V_SubCadena : String := V_Source(V_Source'First..Idx_Delimiter-1);
      begin
         return To_Unbounded_String(V_SubCadena)
           & F_Split(V_Source((Idx_Delimiter+V_Delimiter'Length)..V_Source'Last), V_Delimiter);
      end;
   end;
   
   procedure P_Test_Count is
      V_Cadena : String := "Hola que tal como estas que tal que va que que";
      V_Cadena_Buscada : String := "que";
   begin
      Put_Line(V_Cadena);

      --Metodo Count
      declare
         V_Ocurrencias : Natural := Ada.Strings.Fixed.Count(V_Cadena, V_Cadena_Buscada);
      begin
         Put_Line("El String " & V_Cadena_Buscada
                  &" aparece " & V_Ocurrencias'Image
                  & " veces");
      end;
   end;
   
   procedure P_Test_Index is
      V_Cadena : String := "Hola que tal como estas que tal que va que que";
      V_Cadena_Buscada : String := "que";
   begin
      Put_Line(V_Cadena);
      --Metodo Index
      declare
         V_Posicion_Ocurrencia : Natural := Ada.Strings.Fixed.Index(V_Cadena, V_Cadena_Buscada);
      begin
         while V_Posicion_Ocurrencia /= 0 loop
            Put_Line("El String " & V_Cadena_Buscada
                     &" aparece en la posicion" & V_Posicion_Ocurrencia'Image);

            V_Posicion_Ocurrencia :=  Ada.Strings.Fixed.Index(V_Cadena,
                                                          V_Cadena_Buscada,
                                                          V_Posicion_Ocurrencia+1);
         end loop;
      end;
   end;
   

   procedure P_Test_Replace is
      V_Cadena : String := "Hola que tal como estas que tal que va que que";
      V_Cadena_Buscada : String := "que";
   begin
      Put_Line(V_Cadena);
      --Metodo Replace
      declare
         V_Nueva_Cadena : constant String := "*****";
         Idx_Cadena_Buscada : Natural := Ada.Strings.Fixed.Index(V_Cadena, V_Cadena_Buscada);
      begin
         Put_Line("Reemplazo " & V_Cadena_Buscada & " por " & V_Nueva_Cadena);
         if Idx_Cadena_Buscada /= 0 then

            --Si Tienen la misma longitud
            if (V_Nueva_Cadena'Length = V_Cadena_Buscada'Length) then
               Ada.Strings.Fixed.Replace_Slice(Source => V_Cadena,
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

   end;
   
   procedure P_Test_F_Replace_All is
      S1 : String := "hola hola hola hola hola";
      S2 :String := F_Replace_All(S1,"hola","chau");
   begin
      Put_Line(S1);
      Put_Line(S2);
   end;

   procedure P_Test_F_Split is
      S : String := "Hola que tal como andas";
      Palabras : String_Vector := F_Split(S, " ");
   begin
      Put_Line(S);
      for P of Palabras loop
         Put_Line(To_String(P));
      end loop;
   end;
   

end q_string_utils;
