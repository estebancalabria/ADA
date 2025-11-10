# Lesson 03 - Oct 10, 2025

# Summary

* Floating Point Numbers
* Decimal Variables
* Procedures and Functions
  * Operator overloadint
  * Names parameters
  * Default parameters
  * in/out parameters

# Packages

Packages consisits in two sepparate files
* ADS : Ada Package Specification Files
* ADB : Ada Package Body
 
# Ada's Strog type System 

## Subtype

* Subtype package Specificarion
```ADA
package Demo_Subtypes is

   --subtypes add more scemantic to your code and adds some type checking
   
   subtype Age is Natural range 0..150;
   subtype Age_Underage is Age range 0..17;
   subtype Age_Adult is Age range 18..70;
   subtype Age_Old is Age range 71..150;
   
   function To_String(Item : Age) return String;
end Demo_Subtypes;
```

* Subtype package Body

```ADA

package body Demo_Subtypes is

   function To_String(Item : Age) return String is
   begin
      return Item'Image & " years old";
   end;

end Demo_Subtypes;
```

* SubType USAGE
```ADA
   -- Sample 1: Using custom subtypes
   declare
      --Your_Age : Age := 456; --Runtime Error : Adding a Value outside its Rage. CONSTRAINT_ERROR
      Your_Age : Age := 45; --Runtime Error : Adding a Value outside its Rage. CONSTRAINT_ERROR
      Just_A_Number : Integer := 30;
      Son_Age : Age_Underage := 0;
   begin
      Your_Age := Just_A_Number; --Age type is compatible with Integer so this assignation is Valid
     
      begin
        Son_Age := Your_Age;  -- Compiler Warning
      exception
         when Constraint_Error => Son_Age := Age_Underage'Last;   
      end;
      
      --if (Son_Age in Age_Underage) then
      if (Son_Age'Valid) then
         Put_Line("My son is undergage as Expected");
      end if;
      
         
      Put_Line("Yor age is " & To_String(Your_Age));
   end;
```

---

## New types

- ### : Fruit Sample

New Types Specification Package
```ADA
package Fruits is

   type Apples is new Natural;
   type Pears is new Natural;
   type Bananas is new Natural;
   
   function To_String(Item : Apples) return String;
   function To_String(Item : Pears) return String;
   function To_String(Item : Bananas) return String;

end Fruits;
``

New Types primitives in package body
```ADA

package body Fruits is

   function To_String(Item : Apples) return String is
   begin
      --Similar to ternary operator in other languages
      return Item'Image & (if (item=1) then " apple" else " apples"); 
   end; 
   
   function To_String(Item : Pears) return String is
   begin
      return Item'Image & " pears";      
   end;
   
   function To_String(Item : Bananas) return String is
   begin
      return Item'Image & " banana";      
   end;
   

end Fruits;
```

New Types usages:
```ADA
   --Sample 2 : new Types
   --USING YOUR NEW TYPES IS GOOD PRACTIVA
   declare
      Apples_In_Tree : Apples := 1;
      Pears_In_Bag : Pears := 2;
      Just_A_Number : Integer := 12;
   begin
      
      --is Not Valid
      --Checked at compile time
      --Pears_In_Bag := Apples_In_Tree;

      --is Not Valid
      --Checked at compile time
      --Pears_In_Bag := Apples_In_Tree;
      --IT was VALID with subtypes
      Apples_In_Tree := Just_A_Number;
      
      Put_Line("In my tree I have " & To_String(Apples_In_Tree));
      Put_Line("In my bag I have " & To_String(Pears_In_Bag));
      Put_Line("I Cannot mix pears and apples in the same variable");
   end;
```

---

- ### : Real World Example : Distance

Specification
```ADA
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
```

Body with primitives
```ADA
package body distance is

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
     return Item'Image & " m";
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
```

Usage
```ADA
   --Sample 3 : Real World example on using new types
   declare
      Distance_From_Home : Meters := 1000.0;
      Distance_From_Usa : Kilometers := 2345.0;
      Distance_From_Home_In_USA : Meters := 0.0;
      Random_Float : Float := 5.5;
   begin
      --Not allowed at compile time
      -- Distance_From_Home :=  Distance_From_Usa;
      
      --Not allowed at compile time
      --Distance_From_Usa := Random_Float;
      
      --Canot use this for n o
      Distance_From_Home_In_USA :=  Distance_From_Home + Distance_From_Usa;
      Put_Line("The distance from my home to USA is "  & To_String(Distance_From_Home_In_USA));
   end;
```
