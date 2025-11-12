package distance is

   type Centimeters is new Float;
   type Meters is new Float;
   type Kilometers is new Float;
   
   --Conversions
   function To_Meters(Item: Centimeters) return Meters;
   function To_Meters(Item: Kilometers) return Meters;
   
   --ToString
   function To_String(Item: CentiMeters) return String;
   function To_String(Item: Meters) return String;
   function To_String(Item: Kilometers) return String;
   
   --Overload operators
   function "+"(M : Meters ; KM : Kilometers) return Meters;

end distance;
