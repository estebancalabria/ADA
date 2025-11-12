# Lesson 04 - Oct 12, 2025

# Summary

* Strong Typing (Defining Custom Types)
  * Subtypes (Less Strict)
    * Mostly used for Type Checking using the IN operator
  * New Types (The Preferred ADA way)
  * Predicates
    * DinamicPredicates
    * StaticPredicates
* Packages
  * Types
  * Primitives
* Arrays
  * Constraint Arrays

# More about types

Scpecification
```ADA
package Grades is

   type Grade is new Integer range 1..30;
  
   Passing_Grade : constant Grade := 18;
   
   subtype Grade_Approved is Grade range Passing_Grade..Grade'Last;
   subtype Grade_Failed is Grade range 1..Passing_Grade-1;
   
   function Is_Approved(G: Grade) return Boolean;
   function To_String(G: Grade) return String;

end Grades;
```

Body
```ADA
package body Grades is

   function Is_Approved(G: Grade) return Boolean is
   begin
      return G >= Passing_Grade;
   end Is_Approved;
   
   function To_String(G: Grade) return String is
   begin
      return G'Image;
   end;
   
   
end Grades;
```

 **--Sample 01: Using our own type**
 ```ADA
     declare
        Math_Grade : Grade := 10;
        Phisycs_Grade : Grade := 28;
   
        --Run Time Error
        --Constraint Error : Grade Cannot be greater than 30
        --Sports_Grade : Grade := 50;
        Just_A_Number : Integer := 6;
     begin
        --Compile Time Error
        --Phisycs_Grade := Just_A_Number;
        if Math_Grade in Grade_Failed then
           Put_Line("You Failed Math");
        end if;
     
       if Phisycs_Grade in Grade_Approved then
           Put_Line("You Passed Physics");
        end if;
     end;
```
# Mod data Type

# Arrays

**Sample 2 : Storing Grades in an Array**
```ADA
     declare
        My_Grades : array (1..5) of Grade := (10,20,30,10,28);
     begin
        --for I in 1..5 loop
        for I in My_Grades'Range loop
           Put_Line("My Grade Number " & I'Image & " is " & My_Grades(I)'Image );
        end loop;
     end;
```
**--Sample 3 : Storing Grades in an Array.**
```ADA
   --           Making the Code Better
   -- Optimizaition 1 : When using custom data types define To_String printive instead of using 'Image
   -- Optimizaition 2 : When using arrays is a good practice to declare a new type for the array
   -- Optimizaition 3 : Use a Foreach loop
     declare
        Grade_Count : constant Integer := 5;
   
        type Grade_Array is array (1..Grade_Count) of Grade;
   
        My_Grades : Grade_Array:= (10,20,30,10,28);
     begin
        --for I in 1..5 loop
   
        --  for I in My_Grades'Range loop
        --     Put_Line("My Grade Number " & I'Image & " is " & To_String(My_Grades(I)) );
        --  end loop;
   
        for G of My_Grades loop
           Put_Line("My Grade is " & To_String(G));
        end loop;
    end;
```

**-- Samplw 4 : Using Enums ass array index**
```ADA     
     declare
        type Days_Of_Week is
          (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
        type Days_As_Localized_Srings is array (Days_Of_Week) of String (1 .. 3);
     
        Days_In_English : constant Days_As_Localized_Srings :=
          (Monday   => "Mon", Tuesday => "Tue", Wednesday => "Wed",
           Thursday => "Thr", Friday => "Fri", Saturday => "Sat",
           Sunday   => "Sun");
     
        Days_In_Italian : constant Days_As_Localized_Srings :=
          (Monday   => "Lun", Tuesday => "Mar", Wednesday => "Mer",
           Thursday => "Gio", Friday => "Ven", Saturday => "Sab",
           Sunday   => "Dom");
        
        Today : Days_Of_Week := Wednesday;
   begin
        for Day in Days_Of_Week loop
           Put_Line (Day'Image & "In English is " & Days_In_English(Day) & ", in italian is " & Days_In_Italian(Day));
        end loop;
     
        Put_Line("Today is " & Days_In_English(Today) );
        Put_Line("Today in italian " &  Days_In_Italian (Today) );
   end;
```
   
**-- Sample 4.5 (Parenthesis)**
```ADA
   declare
      --Valid Declaration
      type Very_Very_Long_Array is array (Integer) of Boolean;
      --raised STORAGE_ERROR : EXCEPTION_STACK_OVERFLOW
      --This array is so large it wont fit on memory
      Arr : Very_Very_Long_Array := (others => True);
   begin
      Arr(3) := False;
   end;
```

**-- Sample 5 : Enums with my Grade Data Type**
```ADA
   declare
      Grade_Count : constant Integer := 5;
   
      type Grade_Array is array (1..Grade_Count) of Grade;
   
      My_Grades : Grade_Array:= (10,20,30,10,28);   
   begin
      For G of My_Grades loop
         Put_Line("You got " & To_String(G) & " wich is " & Grade_Interpretation(G)'Image);
      end loop;
   end;
```

**-- Sample 6 : Array Slices**
```ADA
   declare
      Grade_Count : constant Integer := 50;

      type Grade_Array is array (1 .. Grade_Count) of Grade;
      type Smaller_Grade_Array is array (1..10) of Grade;

      My_Grades : Grade_Array :=
        (1 .. 10  => 10, 11 .. 20 => 20, 21 .. 30 => 30, 31 .. 40 => 25,
         41 .. 50 => 12);
      My_Best_Grades : Smaller_Grade_Array;
      
   begin
      --Asignation not valid. Compile time Error
      --Arrays should be the same length
      --My_Best_Grades := My_Grades;
      
      Put_Line("My_Grades Size is " & My_Grades'Length'Image);
      
      --Array Slicing : usually its not done with contrained arrays
      --BUT CASTING IS NOT GOOG WE SHOULD AVOID
      My_Best_Grades := Smaller_Grade_Array(My_Grades(15..24));
      
      for G of My_Best_Grades loop
         Put_Line
           ("You got " & To_String (G) & " wich is " &
            Grade_Interpretation (G)'Image);
      end loop;
   end;
```

**- Sample 7 : Enums with my Grade Data Type and Array Slicing**

Add Library at the top
```ADA
with Ada.Characters.Handling; use Ada.Characters.Handling;
```

Sample
```ADA
   declare
      Grade_Count : constant Integer := 5;
   
      type Grade_Array is array (1..Grade_Count) of Grade;
   
      My_Grades : Grade_Array:= (10,20,30,10,28);
      
      function To_Title_Case(S:String) return String is
      begin
         return To_Upper(S(S'First)) & To_Lower(S(S'First+1..S'Last) ); 
      end;
      
   begin
      For G of My_Grades loop
         Put_Line("You got " & To_String(G) & " wich is " & To_Title_Case(Grade_Interpretation(G)'Image));
      end loop;
   end;
```


# String

# Standard Libraries
