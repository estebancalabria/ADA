with Ada.Text_IO;

package body distance is

   function Float_To_String (Value : Float) return String is
      package FIO is new Ada.Text_IO.Float_IO (Float);
      S : String (1 .. 20);
      Last : Natural;
   begin
      FIO.Put (To => S, Item => Value, Aft => 4, Exp => 0);
      Last := S'Last;
      while S (Last) = ' ' loop
         Last := Last - 1;
      end loop;
      return S (1 .. Last);
   end Float_To_String;

      --Conversions
   function To_Meters(Item: Centimeters) return Meters is
   begin
      return Meters(Item / 100.0);
   end To_Meters;
   
   function To_Meters(Item: Kilometers) return Meters is
   begin
      return Meters(Item * 1000.0);
   end To_Meters;
   
   --ToString
   function To_String(Item: CentiMeters) return String is
   begin
      return Item'Image & " cm";
   end;
   
   function To_String(Item: Meters) return String is
   begin
     return Float_To_String(Float(Item)) & " m";
   end;
   
   function To_String(Item: Kilometers) return String is
   begin
     return Item'Image & " km";
   end;
   
   function "+"(M : Meters ; KM : Kilometers) return Meters is
   begin
      return M + To_Meters(KM);
   end;
   

   
end distance;
