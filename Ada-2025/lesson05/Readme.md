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

- ## Sample 5 : Reading Fixed LEngth Strings with Get_Line

```ADA
   --Sample 5 : Reading Fixed LEngth Strings with Get_Line
   declare
      subtype String_Length is Natural;
      Max_String_Length : constant String_Length := 10;
      
      subtype Name_String is String(1..Max_String_Length);
      
      First_Name : Name_String;
      First_Name_Length : String_Length;
      
      Last_Name : Name_String;
      Last_Name_Length : String_Length;
     
   begin
      Put_Line("Enter your First Name");
      
      --This is not the Best Way to do it in this case
      --First_Name := Get_Line;  --Error if I enter les than Max_String_Lenth;
      
      Get_Line(First_Name, First_Name_Length);
      if First_Name_Length=Max_String_Length then
         Skip_Line;
      end if;
      
      Put_Line("Enter your Last Name");
      Get_Line(Last_Name, Last_Name_Length);
      if Last_Name_Length=Max_String_Length then    
         Skip_Line;
      end if;
      
      --Full_Name := First_Name;   --Not Valid
      --Full_Name :=  First_Name & Last_Name; --Valid
      declare
         Full_Name: String := First_Name(1..First_Name_Length) & " "  & Last_Name(1..Last_Name_Length); 
      begin
         Put_Line("Hello " & Full_Name);   
      end; 
   end;


```
# Unbounded Strings (More similar to strings used in other languages)

