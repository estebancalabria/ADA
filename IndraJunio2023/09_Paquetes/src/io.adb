with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;

package body Io is

   function Prompt
     (Mensaje:String:="Ingresar un string no vacío";
      Error_String_vacio:String:= "Ha ingresado un String vacío") return String is
      
      use Ada.Strings;
      use Ada.Strings.Fixed;
      
   begin
      Put_Line(Mensaje);
      loop
         declare
            Entrada : String := Trim(Get_Line, Both);
         begin
            if Entrada'Length>0 then  --Pasenme la linea 21 corregida
               return Entrada;
            end if;
            Put_Line(Error_String_vacio);
         end;
      end loop;
   end Prompt;
   
   function Prompt     
     (Mensaje:String:="Ingrese un Numero";
      Mensaje_Error:String:= "No ha ingresado un numero") return Integer is

      Result : Integer;     
      Entrada_Correcta : Boolean := False;
   begin
      Put_Line(Mensaje);
      
      while not (Entrada_Correcta) loop           
       declare 
         Entrada : String := Get_Line;
         begin       
            Result := Integer'Value(Entrada);            
            Entrada_Correcta := True;            
         exception               
            when others => Put_Line(Mensaje_Error);               
         end;         
      end loop;
      
      return Result;
   end Prompt;
   
   function "&"(Str:String; N:Integer) return String is
   begin
      return Str & N'Image;
   end;
   
end Io;
