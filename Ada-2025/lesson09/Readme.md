# Lesson - Dec 01, 2025

# Summary

* Access types (Ada way of handling pointers)
    * type Float_Pointer is access Float;
    * .all
      * (for dereferencing the pointer)
    * new Type'()
    * Null_Pointer := null
    * When they point to some address they cannot be changed and point to another variable.
* Access all types
    * type Float_All_Pointers is access all Float;
    * When you want a Variable to be pointed with an access declare it
        * Number : aliased Float;
* Access with Records
    * You can ommit the .all and use an access to a record as a normal record
* Access to procedures/function
    * Similar to functional programing
 
  
# Generics

- ## Swap without Generics

```ada
   -- Sample 1 : Swap methods without Generics
   declare
      type Point is record
         X,Y : Integer;
      end record;
      
      N1, N2 : Integer;
      F1, F2 : Float;
      P1, P2 : Point;
      
     
      procedure Swap_Integer(A : in out Integer; B :in out  Integer) is
         C: Integer := A;
      begin
         A := B;
         B := C;
      end;
      
      procedure Swap_Float(A : in out Float; B :in out  Float) is
         C: Float := A;
      begin
         A := B;
         B := C;
      end;
      
      procedure Swap_Point(A : in out Point; B :in out  Point) is
         C: Point := A;
      begin
         A := B;
         B := C;
      end;    

   begin
      N1 := 2;
      N2 := 3;
      Put_Line(N1'Image & "  " & N2'Image);
      Swap_Integer(N1, N2);
      Put_Line(N1'Image & "  " & N2'Image);
      
      F1 := 2.0;
      F2 := 3.0;
      Put_Line(F1'Image & "  " & F2'Image);
      Swap_Float(F1, F2);
      Put_Line(F1'Image & "  " & F2'Image);
      
      P1 := (X => 1, Y=> 2);
      P2 := (X =>3, Y=> 2);
      Put_Line(P1.X'Image & "  " & P1.Y'Image);
      Put_Line(P2.X'Image & "  " & P2.Y'Image);
      Swap_Point(P1, P2);
      Put_Line(P1.X'Image & "  " & P1.Y'Image);
      Put_Line(P2.X'Image & "  " & P2.Y'Image);         
   end;
```

> We see a lot of code repetition. All swap methods are almost indentical

- ## Swap with Generics

```ada
   declare
      generic
         type T is private;
      procedure Generic_Swap(A: in out T; B: in out T);
      
      procedure Generic_Swap(A: in out T; B: in out T) is
         C : T := A;
      begin
         A := B;
         B := C;
      end;
      
     type Point is record
         X,Y : Integer;     
      end record;
      
      
      procedure Swap is new Generic_Swap(T => Integer);
      procedure Swap is new Generic_Swap(T => Float);
      procedure Swap is new Generic_Swap(T => Point);
   
      N1, N2 : Integer;
      F1, F2 : Float;
      P1, P2 : Point;
      
   begin
      N1 := 2;
      N2 := 3;
      Put_Line(N1'Image & "  " & N2'Image);
      Swap(N1, N2);
      Put_Line(N1'Image & "  " & N2'Image);
   
      F1 := 2.0;
      F2 := 3.0;
      Put_Line(F1'Image & "  " & F2'Image);
      Swap(F1, F2);
      Put_Line(F1'Image & "  " & F2'Image);
   
      P1 := (X => 1, Y=> 2);
      P2 := (X =>3, Y=> 2);
      Put_Line(P1.X'Image & "  " & P1.Y'Image);
      Put_Line(P2.X'Image & "  " & P2.Y'Image);
      Swap(P1, P2);
      Put_Line(P1.X'Image & "  " & P1.Y'Image);
      Put_Line(P2.X'Image & "  " & P2.Y'Image);
   end;
```
