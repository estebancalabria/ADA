pragma Ada_2012;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

package body Pokedex is

   -----------------
   -- MostrarInfo --
   -----------------

   procedure Mostrar_Info (This : Pokemon) is
   begin
      Put_Line("Soy: " & This.Tipo'Image
               & " con HP " & This.Vida'Image
               & " Ubicado en  (" & This.Ubicacion.Lat'Image
               & "," & This.Ubicacion.Long'Image & ")" );
   end;

   function Is_PuntosDeVida(Value:String) return Boolean is
      ConvertedValue : PuntosDeVida;
   Begin
      ConvertedValue := PuntosDeVida'Value(Value);
      return True;
   exception
      when others => return False;
   end;

   function Is_TipodePokemon(Value:String) return Boolean is
      ConvertedValue : TipoPokemon;
   begin
      ConvertedValue := TipoPokemon'Value(Value);
      return True;
   exception
      when others => return False;
   end;

   function Is_Latitud(Value:String) return Boolean is
      ConvertedValue : Latitud;
   begin
      ConvertedValue := Latitud'Value(Value);
      return True;
   exception
      when others => return False;
   end;

   function Is_Longitud(Value:String) return Boolean is
      ConvertedValue : Longitud;
   begin
      ConvertedValue := Longitud'Value(Value);
      return True;
   exception
      when others => return False;
   end;

   function Get_PuntosDeVida return PuntosDeVida is
      Dato : PuntosDeVida;
      Entrada : Boolean := False;
      EntradaString : Unbounded_String;
   begin
      while (not Entrada) loop
         Put_Line("Ingresa los HP: ");
         EntradaString := To_Unbounded_String(Trim(Get_Line,Both));
         if  (Is_PuntosDeVida(To_String(EntradaString))) then
            Dato := PuntosDeVida'Value(To_String(EntradaString));
            Entrada := true;
         else
            Put_Line("Datos Incorrectos. Vuelva a Ingresar");
         end if;
      end loop;
      return Dato;
   end;

   function Get_Latitud return Latitud is
     Dato :Latitud;
     Entrada : Boolean := False;
     EntradaString : Unbounded_String;
   begin
     while (not Entrada) loop
       Put_Line("Ingresa las coordenadas de latitud: ");
       EntradaString := To_Unbounded_String(Trim(Get_Line,Both));
       if (Is_Latitud(To_String(EntradaString))) then
         Dato := Latitud'Value(To_String(EntradaString));
         Entrada := true;
       else
         Put_Line("Ingrese de nuevo el dato...");
       end if;
     end loop;
   return Dato;
end Get_Latitud;

end Pokedex;
