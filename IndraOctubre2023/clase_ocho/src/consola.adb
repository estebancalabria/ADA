with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;


package body Consola is

   function F_Es_Numero(Item : String) return Boolean is
     Conversion : Integer;
   begin
      Conversion := Integer'Value(Item);
      return True;
   exception
      when others => return False;
   end F_Es_Numero;
   
   function F_Get_Line_Not_Empty
     (Empty_Error_Message : String := Default_Empty_Error_Message) return String is
      use Ada.Strings.Fixed;
   begin
      loop
         declare
            Entrada : String := Get_Line;
         begin
            if Trim(Entrada,Ada.Strings.Both)'Length > 0 then
               return Entrada;
            end if;

            Put_Line(Empty_Error_Message);
         end;
      end loop;
   end;
   
   function F_Get_Integer
     (Empty_Error_Message : String := Default_Empty_Error_Message;
     Not_Integer_Error_Message:String  := Default_Not_Integer_Error_Message
     ) return Integer is
   begin
      loop
         declare
            V_String : String := F_Get_Line_Not_Empty;
         begin
            if f_es_numero(v_string) then
               return Integer'Value(v_string);
            end if;
            Put_Line(Not_Integer_Error_Message);
         end;
      end loop;
   end;
   
   function F_Generic_Prompt
     (Mensaje : String := "Ingrese un valor";
      Error_Message:String := "Error de Ingreso. Vuelva a Intentar") return T is
   begin
      Put_Line(Mensaje);
      loop
         declare
            Result : T;
         begin
            --Result := T'Value(Get_Line) --No me funciona, me falta un metodo general para convertir de un string a el tipo T
            Result := Cast_To_Type(Get_Line);
            return result;
         exception
            when others => Put_Line(Error_Message);
         end;
      end loop;
   end;
   
   function F_Generic_Non_Definitive_Prompt
     (Mensaje : String := "Ingrese un valor";
      Error_Message:String := "Error de Ingreso. Vuelva a Intentar") return T_Non_Definitive is
   begin
      Put_Line(Mensaje);
      L_REPETIR_HASTA_INRESO_CORRECTO:
      loop
         B_TRY_CONVERT:
         begin
            declare
               Result : T_Non_Definitive := Cast_To_Type(Get_Line) ;
            begin
               return result;
            end;
         exception
            when others => Put_Line(Error_Message);
         end B_TRY_CONVERT;
      end loop L_REPETIR_HASTA_INRESO_CORRECTO;
   end;
   
   function F_Generic_Discrete_Prompt
     (Mensaje : String := "Ingrese un valor";
      Error_Message:String := "Error de Ingreso. Vuelva a Intentar") return T_Discrete is
   begin
      Put_Line(Mensaje);
      
      if (T_Discrete'Size < 5) then
         Put ("(");
         for Valor in T_Discrete loop
            Put(Valor'Image & " ");
         end loop;
         Put (")")   ;      
         New_Line;
      else
         Put_Line("Desde " & T_Discrete'First'Image & " hasta " & T_Discrete'Last'Image);
      end if;
      
            
   
      
      L_REPETIR_HASTA_INRESO_CORRECTO:
      loop
         B_TRY_CONVERT:
         begin
            declare
               Result : T_Discrete := T_Discrete'Value(Get_Line) ;
            begin
               return result;
            end;
         exception
            when others => Put_Line(Error_Message);
         end B_TRY_CONVERT;
      end loop L_REPETIR_HASTA_INRESO_CORRECTO;
   end;
   
   function F_Prompt
     (V_Pregunta:String;
      Empty_Error_Message : String := Default_Empty_Error_Message) return String is
   begin
      Put_Line(V_Pregunta);
      return F_Get_Line_Not_Empty(Empty_Error_Message);
   end;
   
   function F_Prompt
     (V_Pregunta:String;
      Empty_Error_Message : String := Default_Empty_Error_Message) return Unbounded_String is
      use Ada.Strings.Unbounded;
   begin
      Put_Line(V_Pregunta);
      return To_Unbounded_String(F_Get_Line_Not_Empty(Empty_Error_Message));
   end;
   
   
   function F_Prompt     
     (V_Pregunta:String;
      Empty_Error_Message : String := Default_Empty_Error_Message;
      Not_Integer_Error_Message:String  := Default_Not_Integer_Error_Message) return Integer is
   begin
      Put_Line(V_Pregunta);
      return F_Get_Integer(Empty_Error_Message, Not_Integer_Error_Message);
   end;
   

   


end Consola;
