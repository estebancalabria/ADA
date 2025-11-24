# Lesson 7 - 24 Oct, 2025

# Summary

* Record
    * Record Declaration
    * Record discriminats (To define the lenght of a field mostly)
    * Record Decllaration
    * Operator overloading
    * Declaration inside Packages

# Exception declaration

```ada

   Not_Implemented : exception;

```

# Excetion throwing/raising

```ada
      if Denominator = 0 then
         raise Constraint_Error with "Fraction denominator Cannot be 0"
      end if;
```

# Abstract Data Type -  private type declaration

## Fraction Data Type

* Package Definition
```ada

package Fractions is

   type Fraction is private;
   
   --Constructor
   function Create(Numerator:Integer; Denominator: Integer) return Fraction;
   
   --Operation
   function "+"(Source:Fraction; Destination:Fraction) return Fraction;
   function "*"(Source:Fraction; Destination:Fraction) return Fraction;
   function Inverse(Item:Fraction) return Fraction;
   
   --Conversion-Methods
   function To_String(Item : Fraction) return String;
   function To_Float(Item : Fraction)  return Float;

private
   
  type Fraction is record
      Num : Integer;
      Den : Integer;
   end record;

   
end Fractions;
```

* Package Body
```ada
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Fractions is
   
   Not_Implemented : exception;
   
   
   --2/4 ==> 1/2   We need to simplify fractions
   
   --This methods is only intended for interal use inside this package
   --Its a private subprogram
   function Maximum_Common_Divisor (A,B : Integer) return Integer is
      A1 :Integer := Abs(A);
      B1 :Integer := Abs(B);
      Temp : Integer;
   begin
      while B1 /= 0 loop
         Temp := B1;
         B1 := A1 mod B1;
         A1 := Temp;
      end loop;   
      return A1;
   end;
   
   function Simpllificate(Item:Fraction) return Fraction is
      MCD : Integer := Maximum_Common_Divisor(Item.Num, Item.Den);
   begin
      return (Num => Item.Num / MCD, Den=> Item.Den / MCD);
   end;
   
   --Constructor
   -- Desired Feature :: I want the user to create ew fractions only using this function
   function Create(Numerator:Integer; Denominator: Integer) return Fraction is
      Result : Fraction := (Num => Numerator, Den => Denominator);
   begin
      --raise exception 
      if Denominator = 0 then
         raise Constraint_Error with "Fraction denominator Cannot be 0";
      end if;
      
      return Simpllificate(Result);
   end Create;
   
   --Operation
   function "+"(Source:Fraction; Destination:Fraction) return Fraction is
      New_Num : Integer := Source.Num * Destination.Den + Destination.Num * Source.Den;
      New_Den : Integer := Source.Den * Destination.Den;
   begin
      return Simpllificate( (Num =>New_Num, Den => New_Den) );
   end;
   
   function "*"(Source:Fraction; Destination:Fraction) return Fraction is
      New_Num : Integer := Source.Num * Destination.Num;
      New_Den : Integer := Source.Den * Destination.Den;
   begin
      return Simpllificate( (Num =>New_Num, Den => New_Den) );      
   end;
   
   function Inverse(Item:Fraction) return Fraction is 
   begin
      return (Num => Item.Den, Den => Item.Num);
   end;   
   
   --Conversion-Methods
   function To_String(Item : Fraction) return String is
   begin
      return Item.Num'Image & "\" & Item.Den'Image;
   end;
   
   function To_Float(Item : Fraction)  return Float is
   begin
      return Float(Item.Num) / Float(Item.Den);
   end;

end Fractions;
```

* Sample usage
```ada
   --Sample 1
   declare
      --I dont want the user to manipulate the internal representation
      --F : Fraction := (Num => 1, Den => 2);
      --WRONG
      --F : Fraction := (Num => 2, Den => 4);
      --EVEN WORSE
      --F : Fraction := (Num => 2, Den => 0);
      
      -- Initialization case 1
      --F: Fraction := Create(1,2);

      -- Initialization case 2
      --F: Fraction := Create(2,4);
      
      -- Initialization case 3 (Expects Exception)
      --F: Fraction := Create(2,0);
      
      F1 : Fraction := Create(1,2);
      F2 : Fraction := Create(2,4);
   begin
      Put_Line(To_String(F1 + F2));
      
      --Put_Line(F1.Num'Image);
   end;
```
