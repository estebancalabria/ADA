# Lesson 8- 26 Nov 2025

# Summary

* Exceptions
  * raise an Exception
  * Declare our custom exceptios
* Abstract data types
  * Custom Abstract Data Type
      * Records
      * private types in package (w/records)
      * privitives
    * Samples
      * Fractions
      * Integer_Stack 
  * Standard Libraries Abstract Data Types
    * Ada.Containters
        * Ada.Containters.Vector
        * Ada.Containters.Double_Linked_List
* Intoduction to Generics

# Access Types 

## Acces Types to "Normal" Variables

* new operator : Allocating Memory
    * Type'  After the tipe we use the colon (') to allocate memory 
* .all : derefence access/pointer
* You have to declare a new type to use access
    * type XXX is access <TYPE> : always references to one variable only
    * type XXX is access all <TYPE> : can reference to many variables (of the same type_
* A variable referenced by an access
    * variable : aliased type; (aliased keyword)

* Sample 1

```ada
   declare
      type Integer_Pointer is access Integer;
      ptr : Integer_Pointer := null;
   begin
      ptr := new Integer'(100);
      --.all dereferences the pointer
      Put_Line("Memory Address " & System.Address_Image(ptr.all'Address));
      Put_Line("Content" & ptr.all'Image);
   end;
```

* Sample 2

```ada
   declare
      --if you want the pointer to point to any variable use all
      type Integer_Pointer is access all Integer;
      Number : aliased Integer := 123;
      Pointer_To_Number : Integer_Pointer := Number'Access;
   begin
      Put_Line("My number is " & Number'Image);
      Pointer_To_Number.all := 300;
      Put_Line("Now my number is " & Number'Image);
   end;
```

* Sample 3 : Null pointers

```ada
   declare
      type Integer_Pointer is access Integer;
      ptr : Integer_Pointer := null;
   begin
      if ptr /= null then
        Put_Line("Content" & ptr.all'Image);
      else
         Put_Line("Pointer is not initialized");
      end if;
   end;
```

## Access to Records

>You can ommit the .all when working with records

* Sample 4 : Record Access

```ada
   --Sample 4
   declare
      type Point is record
         X,Y : Integer := 0;
      end record;
      
      type Point_Access is access Point;
      type Any_Point_Access is access all Point;
      
      Normal_Point : aliased Point := (X => 2, Y => 5);
      Refence_To_Point : Point_Access := new Point'(X => 6, Y => 7);
      Any_Point : Any_Point_Access;
   begin
      Put_Line("My point is ");
      Put_Line("("& Normal_Point.X'Image &"," & Normal_Point.Y'Image &")");
      
      Put_Line("("& Refence_To_Point.all.X'Image &"," & Refence_To_Point.all.Y'Image &")");
      --You can ommit the .all with records
      Put_Line("("& Refence_To_Point.X'Image &"," & Refence_To_Point.Y'Image &")");
      
      Put_Line("Playing with Values");
      
      Any_Point := Normal_Point'Access;
      Any_Point.X := 100;
      
      Any_Point := Any_Point_Access(Refence_To_Point);
      Any_Point.X := 200;

      Put_Line("("& Normal_Point.X'Image &"," & Normal_Point.Y'Image &")");
      Put_Line("("& Refence_To_Point.X'Image &"," & Refence_To_Point.Y'Image &")");      
   end;
   
```

## Access to Procedures and Functions

```ada
   -- Sample 5
   declare
      procedure Say_Hi is
      begin
         Put_Line("HI");
      end Say_Hi;
      
      type Procedure_Access is access procedure;
      
      Proc : Procedure_Access := Say_Hi'Access;
   begin
      --Say_Hi;
      Proc.all;
   end;
```


```ada
   declare
      procedure Say_Hi is
      begin
         Put_Line("HI");
      end Say_Hi;
      
      procedure Say_Bye is
      begin
         Put_Line("Bye");
      end Say_Bye;
      
      type Procedure_Access is access procedure;
      
      Proc : Procedure_Access;
   begin
      --Say_Hi;
      begin
         Proc.all;
      exception
         when others => Put_Line("Executing unitialized method");
      end;
      
      Proc := Say_Hi'Access;
      
      Proc.all;
      
      Proc := Say_Bye'Access;
      
      Proc.all;
      
   end;
```

```ada
   declare
      procedure Print_Integer(Num: Integer) is
      begin
         Put_Line(Num'Image);
      end Print_Integer;
      
      function Add_One(Num: Integer) return Integer is
      begin
         return Num + 1;
      end;
      
      type Integer_Procedure_Access is access procedure (Num: Integer);
      type Function_Access is access function (Num: Integer) return Integer;
      
      Proc_Access : Integer_Procedure_Access := Print_Integer'Access;
      Func_Access : Function_Access := Add_One'Access;
      
   begin
      Proc_Access.all(Func_Access.all(4));
   end;
```

```ada
   --Sample 7 : Procedures or fuctions as parameters
   declare
      function Add(Num_1: Integer; Num_2: Integer) return Integer is
      begin
         return Num_1 + Num_2;
      end Add;
      
      function Substract(Num_1: Integer; Num_2: Integer) return Integer is
      begin
         return Num_1 - Num_2;
      end Substract;

      type Binary_Integer_Operation is access function (Num_1: Integer; Num_2: Integer) return Integer;
      
      function Operate(Num_1: Integer; Num_2: Integer; Operation: Binary_Integer_Operation) return Integer is
      begin
         return Operation.all(Num_1, Num_2);
      end;
      
      
   begin
      Put_Line(Operate(2,2,Add'Access)'Image);
      Put_Line(Operate(3,1,Substract'Access)'Image);      
   end;

```
