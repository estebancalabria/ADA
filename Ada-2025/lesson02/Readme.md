# Lessson 02 -Oct 5, 2025

# Concepts


* Imports (with and use)
* declarative secctions
* Exception handling

#  Floating Point Types

***Floating Poitn Declarations**
```Ada
   --Sample 2 : Floating Point Types
   declare
      X : Float := -3.14159;
      Long_X : Long_Float := -3.14159 *2.0;
      Long_Long_X : Long_Long_Float := -3.14159 * 3.0;
      I : Integer := 2;
   begin
      Put_Line(I'Image); --Nottice the Space before the number
      Put_Line("The Value of X is " & X'Image & " in Scientific notation");
      Put_Line("The size of X is " & X'Size'Image);
      Put_Line("The size of Long_X is " & Long_X'Size'Image);
      Put_Line("The size of Long_Long_X is " & Long_Long_X'Size'Image);   
   end;
```

**Sampe 3 : Show Floats in Human Readable Form**
```ADA
   declare
      --Good practice to use constant if I dont change is value
      X : constant Float := -3.14159;
   begin
      Put("The value of X in a human readable form is ");
      --The next Put is not the same as the previous one
      --This is called overloading
      --Same Method Name, different Parameters
      Put(X, Fore => 1, Aft => 4, Exp => 0);
      New_Line;
      Put_Line(Item => "This is a new Line");
   end;
```

**Sample 4 : Floating Point Precission**
```ADA
   declare
      X : Float := 0.0;
      I : Integer := 1;
   begin
      for I in 1..10 loop
         X := X + 0.1;
      end loop;
      
      Put("The Value of X is ");
      Put(X, Fore => 1, Aft => 10, Exp => 0);
      New_Line;
      
      if X = 1.0 then
         Put_Line("They Are Equals");
      else
         Put_Line("They are not Equals");
      end if;
   end;
```

**Sample 5 - Fixec Point Decimal Variables**
```ADA
  declare
      type Money is delta 0.1 digits 10;
      
      X : Money := 0.0;
      I : Integer := 1;
   begin
      for I in 1..10 loop
         X := X + 0.1;
      end loop;
   
      Put("The Value of X is");
      Put(X'Image);
      New_Line;
   
      if X = 1.0 then
         Put_Line("They Are Equals");
      else
         Put_Line("They are not Equals");
      end if;
   end;
```

**Sample 5 - Integer to Float Conversion**

```ADA
   declare
      X : Float := 0.0;
      I : Integer := 0;
   begin
      --Implicit Conversions are not Allowed in ADA
      --X := I;
      
      X := Float(I);
      Put("The Value of X is ");
      Put(X, Fore => 1, Aft => 10, Exp => 0);
      New_Line;  
   end;
```   
**Sample 6 - Procedures**
```ADA
   declare
      X : Float := 0.0;
      I : Integer := 0;
      
      procedure Show_Float_In_Human_Readable_Form(Message : String; Number : Float ) is
      begin
         Put(Message);
         Put(Number, Fore => 1, Aft => 10, Exp => 0);
         New_Line;
      end Show_Float_In_Human_Readable_Form;
      
   begin
      --Implicit Conversions are not Allowed in ADA
      --X := I;
      X := Float(I);
      Show_Float_In_Human_Readable_Form("The Value of X is " , X);
   end;
```
