with Ada.Text_IO; use Ada.Text_IO;

package body Integer_Array is
  

   procedure Mostrar_Numeros(Lista_Numeros :in Conjunto_De_Numeros) is
   begin
      Put("(");
      for I in Lista_Numeros'Range loop
         Put(Lista_Numeros(I)'Image);
         
         if (I /= Lista_Numeros'Last) then
            Put(",");
         end if;
      end loop;   
      Put(")");
      New_Line;
   end Mostrar_Numeros;
   
   function Crear(Cantidad:Integer; Default : Integer) return Conjunto_De_Numeros is
        Aux : Conjunto_De_Numeros(1..Cantidad) := (others => Default);
   begin
        return Aux;
   end Crear;
   
   function Crear_Secuencia(Valor_Inicial:Integer; Valor_Final: Integer) return Conjunto_De_Numeros is
      N : Conjunto_De_Numeros (Valor_Inicial .. Valor_Final);   
   begin
      for I in N'Range loop
         N(I) := I;      
      end loop;            
      return N;
   end Crear_Secuencia;
   
    procedure Revertir(Lista_Numeros: in out Conjunto_De_Numeros) is
      Aux : Integer;   
      Ultimo_Actual : Integer := Lista_Numeros'Last;
   begin      
      for I in Lista_Numeros'First..Lista_Numeros'Last/2 loop
         AUX := Lista_Numeros(I);
         Lista_Numeros(I) := Lista_Numeros(Ultimo_Actual);
         Lista_Numeros(Ultimo_Actual) := AUX;      
         Ultimo_Actual := Ultimo_Actual -1;
      end loop;   
   end Revertir;
   
   function "&" (Source:Conjunto_De_Numeros; Dest:Conjunto_De_Numeros) return Conjunto_De_Numeros is
   begin
      --SE animan a hacer el concatwnar?
     return Source;
   end;
   --  
   --  function "&" (Source:Numeros; Dest:Integer) return Numeros
   --  begin
   --     return Source & Dest;
   --  end;
   
   function Slice(Source : Conjunto_De_Numeros; From : Integer; To : Integer) return Conjunto_De_Numeros is
   begin
      return Source(From..To);   
   end Slice;
   
   function Pertenece (Valor : Integer; Arreglo : Conjunto_De_Numeros) return Boolean is
      Ok : Boolean := False;      
      I : Integer := Arreglo'First;   
   begin      
      while (not Ok) and (I <= Arreglo'Last) loop
         if Arreglo(I) = Valor then
            Ok := True;         
         end if;         
         I := I+1;      
      end loop;            
      return Ok;   
   end Pertenece;
   
   function Agregar (Valor : in Integer; Arreglo : in Conjunto_De_Numeros) return Conjunto_De_Numeros is
   begin
      return (if (Pertenece(Valor,Arreglo)) then Arreglo else Arreglo & Valor);   
      
      --  if (Pertenece(Valor,Arreglo)) then
      --     return Arreglo;
      --  end if;
      --  return Arreglo & Valor;
   end Agregar;
   
   --  procedure Add(Valor:integer; Arreglo:in out Numeros) is
   --  begin
   --     Arreglo := Arreglo & Valor;
   --  end;
   

end Integer_Array;
