with Ada.Text_IO; use Ada.Text_IO;
with Consola;
with Ada.Containers.Vectors;

package body Q_Vector_Integer is

   procedure P_Ejercicio_Vector is
      package Q_Integer_Vector is new Ada.Containers.Vectors
        (Element_Type => Integer,
         Index_Type => Positive);
      
      package Q_Integer_Vector_Sorting is new Q_Integer_Vector.Generic_Sorting;
      
      use Q_Integer_Vector;
      use Q_Integer_Vector_Sorting;  --Tiene el metodo Merge
      
      procedure P_Mostrar_Vector(V_Lista : Vector) is
      begin
         if V_Lista.Is_Empty then
            Put_Line("()");
         else
            Put("(");
           
            for Numero of V_Lista loop --foreach
               
               if V_Lista.Reverse_Find_Index(Numero) /= V_Lista.Last_Index then
                  Put(Numero'Image);
                  Put(",");
               else
                  Put(Numero'Image);
               end if;
                               
            end loop;
            
            Put(")");
            
            New_Line;
         end if;
      end P_Mostrar_Vector;
      
      procedure P_Mostrar_Vector(Variable : String; V_Lista : Vector) is
      begin
         if V_Lista.Is_Empty then
            Put_Line(Variable & "esta vacia");
         else
            --for Indice in V_Lista.First_Index..V_Lista.Last_Index loop
            --for Indice in V_Lista.First_Index..V_Lista.Last_Index loop
               ----Put_Line(Variable & "(" & Indice'Image & ") = " & V_Lista(Indice)'Image);--No anda
            --   Put_Line(Variable & "(" & Indice'Image & ") = " & Integer'Image(V_Lista(Indice)));               
            --end loop;
            
           for Indice in V_Lista.Iterate loop
               --Put_Line(Variable & "(" & Indice'Image & ") = " & V_Lista(Indice)'Image);
               Put_Line(Variable & "("
                        & To_Index(Indice)'Image
                        & ") = "
                        & Integer'Image(V_Lista(Indice)));               
            end loop;

         end if;
      end P_Mostrar_Vector;
      
      procedure Doble(Valor : in out Integer) is
      begin
         Valor := Valor * 2;
      end;
       
        
      V_Lista_Numeros : Vector;
      V_Otra_Lista_Numeros : Vector;

      --      V_Lista_Numeros : Q_Integer_Vector.Vector; --O asi  
   begin
      --  V_Lista_Numeros.Append(5);
      --  V_Lista_Numeros := V_Lista_Numeros & 2 & 1 & 4;
      --  
      --  V_Otra_Lista_Numeros := 3 & 7 & 6;
      --  
      --  --V_Lista_Numeros := V_Lista_Numeros & V_Otra_Lista_Numeros;
      --  --Lo mismo que
      --  Merge(V_Lista_Numeros, V_Otra_Lista_Numeros);
      --  
      --  
      --  
      --  --Itero mi lsta de numeros
      --  -- for Numero of V_Lista_Numeros loop
      --  --    Put_Line(Numero'Image);
      --  -- end loop;
      --  
      --  --P_Mostrar_Vector(V_Lista_Numeros);
      --  
      --  --P_Mostrar_Vector("V_Lista_Numeros" , V_Lista_Numeros);
      --  
      --  P_Mostrar_Vector(V_Lista_Numeros);
      --  Sort(V_Lista_Numeros);
      --  P_Mostrar_Vector(V_Lista_Numeros);


         
      --Quiero que el usuario agregue elementos a la lista por consola
      --Se le pediran numeros hasta que ingresa el 0 (No lo agrego)
      Put_Line("Ingrese numeros (0 para salir)");
      declare
         V_Numero_Usuario : Integer := Consola.F_Get_Integer;
      begin
         while V_Numero_Usuario /= 0 loop
            V_Lista_Numeros.Append(V_Numero_Usuario);
            V_Numero_Usuario  := Consola.F_Get_Integer;
         end loop;
      end;
      

      
      Put_Line("El arreglo Ingresado es: ");
      P_Mostrar_Vector(V_Lista_Numeros);
      
      for Idx in V_Lista_Numeros.Iterate loop
         V_Lista_Numeros.Update_Element(Idx, Doble'Access);
      end loop;
      
      Put_Line("Calculo el doble de cada elemento: ");
      P_Mostrar_Vector(V_Lista_Numeros);
      
      
      Put_Line("Ingrese un numero para saber si esta en el vector");
      declare
         V_Indice : Extended_Index;
         V_Numero_Buscado : Integer := Consola.F_Get_Integer;
      begin
         V_Indice := V_Lista_Numeros.Find_Index(V_Numero_Buscado);
         
         if V_Indice /= No_Index then
            Put_Line("El elemento "
                     & Integer'Image(V_Lista_Numeros(V_Indice))
                     & " se encuentra en la posicion "
                     & V_Indice'Image);
                       
         else
            Put_Line("El elemento no esta la lista");
         end if;        
      end;      
   end;

end Q_Vector_Integer;
