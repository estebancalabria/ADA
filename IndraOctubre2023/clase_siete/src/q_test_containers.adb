with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Indefinite_Ordered_Maps;
with Q_String_Utils; use Q_String_Utils;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Q_Test_Containers is

   procedure P_Test_Ordered_Map is
      
      --El paquete Ada.Containers.Indefinite_Ordered_Maps es generico
      package Diccionario is new Ada.Containers.Indefinite_Ordered_Maps
        (Key_Type => String,
         Element_Type => String);
      
      V_Diccionario  : Diccionario.Map;
   begin
      Put_Line("Agrego 'ADA' al diccionario");
      V_Diccionario.Include("ADA", "El mejor lenguaje de programacion del mundo");
      
      Put_Line("Agrego 'Variable' al diccionario");
      V_Diccionario.Include("Variable", "Lugarcito en memoria donde guardo datos");
      
      Put_Line("Agrego 'String' al diccionario");
      V_Diccionario.Include("String", "Para almacenar cadenas de Caracteres");
      
      New_Line;
      
      Put_Line("La definicion de 'Variable' es");
      if V_Diccionario.Contains("Variable") then
         Put_Line(V_Diccionario("Variable"));
      end if;
      
      Put_Line("La definicion de 'Perro' es");
      Put_Line((if V_Diccionario.Contains("Perro") 
               then V_Diccionario("Perro") 
               else "'Perro' no esta en el diccionario"));

      New_Line;
      Put_Line("Le cambio la definicion a varible");
      V_Diccionario.Replace("Variable", "**Nueva Definicion**");
      Put_Line("La definicion de 'Variable' nueva es");
      if V_Diccionario.Contains("Variable") then
         Put_Line(V_Diccionario("Variable"));
      end if;                 
      
      New_Line;
      Put_Line("Vamos a iterar el diccionario");
      For C in V_Diccionario.Iterate loop
         Put_Line( Diccionario.Key(C) & "=" & V_Diccionario(C));
      end loop;   
   end;
   
   procedure P_Test_Contar_Palabras(V_Cadena:String) is
      
      package Q_Contador_Palabras is new Ada.Containers.Indefinite_Ordered_Maps
        (Key_Type => String,
         Element_Type => Integer);
      
      V_Contador_Palabras : Q_Contador_Palabras.Map;
      V_Palabras : String_Vector := F_Split(V_Cadena, " ");
   begin
      
      For V_Palabra of V_Palabras loop
         if V_Contador_Palabras.Contains(To_String(V_Palabra)) then
            V_Contador_Palabras.Replace
              (To_String(V_Palabra),
               V_Contador_Palabras(To_String(V_Palabra)) + 1);             
         else
            V_Contador_Palabras.Include(To_String(V_Palabra), 1);
         end if;         
      end loop;
      
      For C in V_Contador_Palabras.Iterate loop
         Put_Line("La palabra " & 
                    Q_Contador_Palabras.Key(C)  &                    
                    " aparece" &
                    Integer'Image(V_Contador_Palabras(C)) &
                    (if V_Contador_Palabras(C)=1 then " vez" else " veces"));                    
      end loop;           
   end;
end q_test_containers;
