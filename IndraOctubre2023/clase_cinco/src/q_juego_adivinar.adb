with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random;
with Consola; 

package body Q_Juego_Adivinar is

   procedure Jugar is 
      
      function F_Generate_Random(V_Min_value :Integer; V_Max_value : Integer) return Integer is 
         use Ada.Numerics.Float_Random;
         --type T_Numero_Al_Azar is range V_Min_value..V_Max_value; No funciona
         V_Generador : Generator;
      begin
         Reset(V_Generador);
         return  Integer(Float(V_Min_value) + Random(V_Generador) * Float(V_Max_value - V_Min_value));
      end;
      
      C_Max_Oportunidades : constant Integer := 5;
      type T_Numero_Secreto is new Integer range 1..100;
      
      V_Oportunidad_Actual : Integer := 1;
      V_Numero_Secreto : T_Numero_Secreto;
      V_Numero_Adivinado : T_Numero_Secreto;

   begin
         
      --  La computadora determina un V_Numero_Secreto al Azar entre 1 y 100
      --  El usuario tiene 5 oportunidades para adivinar (C_Cantidad_Oportunidades)
      --  Cada vez arriesga un numero, la comptadora le informa si
      --  el numero secreto es mayor o menor al numero ingresado
      --  Si adivina antes de las 5 oportinidades gana, sino pierde
      --  Usar la clase consola.
      Put_Line("Bienevenidos al juego. Tiene que adivinar un numero. Tiene "
                    
               & C_Max_Oportunidades'Image);
      --Si quiero evitar castear, mantenganse sintonizados para ver genericos
      V_Numero_Secreto := T_Numero_Secreto
        (F_Generate_Random
           (Integer(T_Numero_Secreto'First),
            Integer(T_Numero_Secreto'Last)));
      
      loop
         Put_Line("Ingrese un Numero. Oportunidad"
                  & V_Oportunidad_Actual'Image
                  & " de "
                  & C_Max_Oportunidades'Image);
         
         V_Numero_Adivinado := T_Numero_Secreto(Consola.F_Get_Integer);
         
         if (V_Numero_Adivinado>V_Numero_Secreto) then
            Put_Line("El Numero Ingresado es mayor al Secreto");
         elsif (V_Numero_Adivinado<V_Numero_Secreto) then
            Put_Line("El Numero Ingresado es menor al Secreto");
         end if;
         
         V_Oportunidad_Actual := V_Oportunidad_Actual + 1;
         
         exit when V_Numero_Adivinado=V_Numero_Secreto;
         exit when V_Oportunidad_Actual>C_Max_Oportunidades;
      end loop;
      
      New_Line;
      Put_Line((if V_Numero_Adivinado=V_Numero_Secreto
               then "Felicidades has adivinado"
               else "Has perdido. El numero era " & V_Numero_Secreto'Image));   
   end Jugar;
   

end Q_Juego_Adivinar;
