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

- ## Sample 4 : Discriminat recortds

```ada
   --Sample 4 - Records with discriminants
   declare
   
      --Records should have a fixex length. This wont compile
      --  type Person is record
      --     First_Name : String;
      --     Last_Name : String;
      --  end record;
      
      --  Name_Length : constant Integer := 5;
      --  subtype Name_String is String(1..Name_Length);
      --  type Person is record
      --     First_Name : Name_String;
      --     Last_Name : Name_String;
      --  end record;
      
      --  Name_Length : constant Integer := 5;
      --  type Person (Size:Natural) is record
      --     First_Name : String(1..Size);
      --     Last_Name : String(1..Size);
      --  end record;
      
      type Person (First_Name_Length : Natural; Last_Name_Length : Natural) is record
           First_Name : String(1..First_Name_Length);
           Last_Name : String(1..Last_Name_Length);
      end record;
      
      --Now My Last Name and My first name shoult have exacly Name_Lenght characters
      --Me : Person := (First_Name=> "Esteb", Last_Name => "Calab");
      First_Name : String := "Esteban";
      Last_Name : String := "Calabria";
      Me : Person := (First_Name_Length => First_Name'Length,                     
                      Last_Name_Length => Last_Name'Length,                
                      First_Name=> First_Name,                      
                      Last_Name => Last_Name);
     
      function To_String(APerson:Person) return String is
      begin
         return APerson.First_Name & " " & APerson.Last_Name;
      end;
      
   begin
      Put_Line(To_String(Me));
      Put_Line(Me.First_Name_Length'Image); --Its also a field
   end;
```

- # Sample 5 : Full Discriminant Records

```ada
   -- Sample 5 : Full Discriminant Records
   declare
      --Discriminants muyt be a discrete type
      --NOT POSIIBLE
      --  type Person (First_Name : String; Last_Name:String) is record
      --       null;
      --  end record;
      
      --Some people do this
      type Point (X:Integer; Y:integer)is record
         null;         
      end record;
      --instead of this
      --  type Point is record
      --     X:Integer;
      --     Y:integer;
      --  end record;
      --But I wont recomend it
      
      My_Point : Point := (X => 1, Y => 2);
   begin
      Put_Line(My_Point.X'Image & "-" & My_Point.Y'Image);   
   end;
```

- # Sample 6 : Using Records With Packages

* Package Specification

```ada
package Points is

   subtype Point_Distance is Float;
   
   type Point is record
      X,Y : Float := 0.0;
   end record;
   
   function "+"(Source: Point; Destination: Point) return Point;

   function To_String(Value:Point) return String;
   
   function Length(Value : Point ) return Point_Distance;
   
end Points;
```

* Package Body

```ada
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Points is

   function "+"(Source: Point; Destination: Point) return Point is
      result : Point;
   begin
      result.X := Source.X + Destination.X;
      result.Y := Source.Y + Destination.Y;
      return result;
   end;
   

   function To_String(Value:Point) return String is
   begin
      return "(" & Value.X'Image & "," & Value.Y'Image & ")";
   end;
   
   
   function Length(Value : Point ) return Point_Distance is
   begin
      return  Sqrt( (Value.X * Value.X) + (Value.Y * Value.Y) );                                      
   end Length;
        

end Points;
```

* package Import

```ada
with Points; use Points;
```

* Usage

```ada
   -- Sample 06
   declare
      P1 : Point := (X=>2.0, Y=>3.0);
      P2 : Point := (X=>1.0, Y=>0.0);
      P3 : Point;
   begin
      Put_Line(To_String(P1));
      P3 := P1 + P2;
      Put_Line(To_String(P3));
      Put_Line("P1 length" & Length(P1)'Image);
   end;
```

