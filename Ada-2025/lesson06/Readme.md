# Lessson 06 - Oct, 19, 2025

# Summary

* Strings
  * Constrained Strings
        * I cannot assing one string to another if they have different length (CONSTRAINED_ERROR)
  * Unconstained Strings
        * Packages
              * Ada.Strings.Unbounded (Type Declaration)
              * Ada.Strings.Unbounded.Text_IO (User Input Procedures and Funtions)
        * Methods
              * To_String
              * To_Unbouded_String
    
* Handling User Input
    * Common Methods
          * Get_Line => Name : String := Get_Line
             * The size of the string will be infered from the user input
           * Get_Line(Name, Actual_Length)
             * Name has a fixed length
             * Actual_Length is the number of characters that the user input
           * Skip_Line : To discard the rest of the characters when user input is larger thant the size of the string
     * Working with other types
           * Ada.Integer.Text_IO;
               * Get(Age)
     * Exception Handling
         * Data_Error
         * Constrain_Error

   # Records

   - ## Sample 1 : Record Declaration

  ```ada
     --Sample 1 : Declarin our first Record
   declare
      subtype Day is Positive range 1..31;
      subtype Month is Positive range 1..12;
      subtype Year is Positive range 1..3000;
      
      type Date is record
         ADay : Day;
         AMonth : Month;
         AYear : Year;
      end record;
     
      Birth_Date : Date := (20,9,1980);
   begin
      Put_Line(Birth_Date.ADay'Image & "/" & Birth_Date.AMonth'Image & "/" & Birth_Date.AYear'Image);
   end;

  ```

  - ## Sample 2: New types and Explicit Intiazliation

Libraries we used for Trim method
```ada
with Ada.Strings.Fixed; 
```


```ada
  --Sample 2 : Making it better
declare
  type Day_Value is new Positive range 1..31;
  type Month_Value is new Positive range 1..12;
  type Year_Value is new Positive range 1..3000;
  
  type Date is record
     Day : Day_Value;
     Month : Month_Value;
     Year : Year_Value;
  end record;
  
  function Replace_Character(Text:String; From : Character; To :Character) return String is
     Result : String := Text;
  begin   
     for I in Result'Range loop
        if Result(I) = From then
           Result(I)  := To;
        end if;            
     end loop;
     
     return Result;
  end;
  
 
  function To_String(Value : Date) return String is
  begin
     return Replace_Character(Value.Day'Image,' ','0')
       & "/" & Replace_Character(Value.Month'Image,' ','0')
       & "/" & Ada.Strings.Fixed.Trim(Value.Year'Image, Ada.Strings.Both);
  end;
  
 
  --Explicit Initialization istead of positional initializaition
  Birth_Date : Date := (Year => 1980, Month => 9, Day => 20);
  
begin
  Birth_Date.Day := 1;

  --This ok with subtypes but its conceptually wrong
  --This evenentyally could lead to errors
  --Month and Day are conceptually different things
  --I Changed the subtypes to new types
  --Birth_Date.Month := Birth_Date.Day; 
  
  Put_Line(To_String(Birth_Date));   
end;
```

- ## Sample 3 : Record Asignatation and operator overloading

```ada
   declare
      
      --Record with default value
      type Coordinate is record
         X : Float := 0.0;
         Y : Float := 0.0;
      end record;
      
      Origin : constant Coordinate := (X => 0.0, Y => 0.0); 
      XOne_YOne : constant Coordinate := (X => 1.0, Y => 1.0); --I know this is wrong
      Custom_Coordinage : Coordinate;
      
      function To_String(Value :Coordinate) return String is
      begin
         return "(" & Value.X'Image & "," & Value.Y'Image &")";
      end To_String;
      
      function "+"(Source: Coordinate; Destination : Coordinate) return Coordinate is
         Result : Coordinate;
      begin
         Result.X := Source.X + Destination.X;
         Result.Y := Source.Y + Destination.Y;
         return Result;
      end "+";
      
   begin
      --Record Asignation
      Custom_Coordinage := XOne_YOne + XOne_YOne;
      
      Put_Line(To_String(Custom_Coordinage));
   end;
```
