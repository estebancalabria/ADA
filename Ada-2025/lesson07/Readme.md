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

## Integer_Stack

*Package Specification
```ada
package Integer_Stack is
   
   Stack_Overflow : exception;
   Stack_Empty: exception;

   type Stack(Max_Length:Positive) is private;
   
   procedure Push(Item: in out Stack; Value : Integer);
   function Pop(Item: in out Stack) return  Integer;
   function Is_Empty(Item: Stack) return Boolean;
   function Is_Full(Item: Stack) return Boolean;

private   
   
   type Stack_Data is array (Positive Range <>) of Integer;
   
   type Stack(Max_Length:Positive) is record
      Last_Index : Natural := 0;
      Data :  Stack_Data(1..Max_Length);
   end record;

end Integer_Stack;
```

*Package Body
```ada
package body Integer_Stack is

   procedure Push(Item: in out Stack; Value : Integer) is
   begin
      if (Item.Last_Index = ITem.Data'Last) then
         raise Stack_Overflow with "Stack Overflow. Stack is full";      
      end if;
      
      Item.Data(Item.Last_Index+1) := Value;
      Item.Last_Index := Item.Last_Index+1;
   end Push;
   
   
   function Pop(Item: in out Stack) return  Integer is 
      Result : Integer;
   begin
      if Item.Last_Index=0 then
         raise Stack_Empty with "Cannot Pop : Stack is empty";      
      end if;
      
      Result := Item.Data(Item.Last_Index);
      Item.Last_Index := Item.Last_Index - 1;
      return Result; 
   end Pop;
   
   function Is_Empty(Item: Stack) return Boolean is
   begin
      return Item.Last_Index=0;
   end Is_Empty;
   

   function Is_Full(Item: Stack) return  Boolean is
   begin
      return Item.Last_Index = ITem.Data'Last;
   end Is_Full;
   
end Integer_Stack;
```

*Package Usage Declaration
```ada
with Integer_Stack; use Integer_Stack;
```

*Package Usage Sample
```ada
   --Sample 4 : Integer Stacl
   declare
      My_Stack : Stack(10);
   begin
      Push(My_Stack, 10);
      Push(My_Stack, 20);
      Push(My_Stack, 30);
      Push(My_Stack, 40);
      
      while not(Is_Empty(My_Stack)) loop
         declare
            Elem : Integer := Pop(My_Stack);
         begin
            Put_Line(Elem'Image);
         end;         
      end loop;      
   end;

```


# Ada.Containers (Existing ADA Types)

## Vector (Generic Type Introduction)

* Package
```ada
with Ada.Containers.Vectors;--List<> in hava
```

* Usage
```ada
   --Sample 2 : Use existing Abstract Data Type
   declare
      package Integer_Vector is new Ada.Containers.Vectors
        (Index_Type => Positive,
         Element_Type => Integer);
      
      use Integer_Vector;
      
      Numbers : Vector;
   begin
      Append(Numbers, 35);
      Append(Numbers, 20);
      Append(Numbers, 50);
      Append(Numbers, 6);
      
      for Num of Numbers loop
         Put_Line(Num'Image);
      end loop;
      
   end;
```

## Double Linked List

* Package
```ada
with Ada.Containers.Doubly_Linked_Lists
```

* Usage
```ada
   declare
      package Integer_List is new Ada.Containers.Doubly_Linked_Lists
        (Element_Type=> Integer);
      
      My_List : Integer_List.List;
   begin
      --Since i dod not write use Imteger_list i have to put the name of the package all the time
      Integer_List.Append(My_List, 200);
      Integer_List.Append(My_List, 300);
      Integer_List.Append(My_List, 400);
      Integer_List.Prepend(My_List, 100);
      
      for Num of My_List loop
         Put_Line(Num'Image);
      end loop;
   end;
```
