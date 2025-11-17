# Lesson 05 - Nov 17, 2025

# Summary

* Custom Types
* Arrrays
  * Constrained array : Predefines Length
  * Unconstraines : Array length is defined when you declare a Variable of that Type
  * Working with arrays
      * Itearation
      * Array Parameter Handling
      * ...
* Standard Libraries
  * Ada.Characters.Handling;

# Strings (Speccialy type of uncontrained Array)

```ada
   --Sample 01 - Definning Strings
   -- Strins are a special case of Unconstraina arrays
   -- When you define them you have to define their length
   -- their declaration is similar to this
   -- type String is array (Positive range <>) of Character
   -- But you can asign them with := "String" uinsteado of := ('S','t','r','i','n','g');
  declare
        -- Name : String; You cannot to this, you have to declar its lengh
        Name : String(1..5);
  begin
     Name := Get_Line; --It Will only work if you read exactly 5 caracers
     Put_Line(Name);
  end;
```

```ada
   --Sample 2 " Declare their length Implicitly
  declare
        First_Name : String := "Esteban"; --The compiler does FirstName : String (1...7);
        --First_Name : String(1..8) := "Esteban"; --The compiler does FirstName : String (1...7);
  begin
     Put_Line(First_Name);
     Put_Line("First Letter index is : " & First_Name'First'Image);
     Put_Line("Last Letter index is : " & First_Name'Last'Image);
     Put_Line("First Letter is : " & First_Name(First_Name'First) );
     Put_Line("Last Letter  is : " & First_Name(First_Name'Last) );
  end;
```

- ## Not All Strigns are the same in ada! Be careful!!

```ada
   --Sample 2.5 : Strings are picky
   declare
      Name_1 : String := "Fererico";
      Name_2 : String := "Gabriele";  --Same length as Name_1
      Name_3 : String := "Roberto";
   begin
      Name_2 := Name_1; --Works ok, Same length
      Name_3 := Name_1; --Wrong - Constraint error, different length
   end;
   
````

# User Input

- ## Declaring String Length implicitly with user Input
```ADA
   --Sample 3 :  Strings Initialization with user Input
   Put_Line("Enter your First Name");
   declare
      First_Name : String := Get_Line; --Declare its Length implicitly with user input
   begin
      Put_Line("Enter your Last Name");      
      declare
         Last_Name : String := Get_Line;
      begin
         Put_Line("Hello " & First_Name & " " & Last_Name );
      end;
   end;
```

# Unbounded Strings (More similar to strings used in other languages)

