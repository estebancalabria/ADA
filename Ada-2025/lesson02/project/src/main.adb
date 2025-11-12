with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Main is

begin
   --Sample 1
   Put_Line ("Welcome to Lesson 2");

   --Sample 2 : Floating Point Types
   --  declare
   --     X : Float := -3.14159;
   --     Long_X : Long_Float := -3.14159 *2.0;
   --     Long_Long_X : Long_Long_Float := -3.14159 * 3.0;
   --     I : Integer := 2;
   --  begin
   --     Put_Line(I'Image); --Nottice the Space before the number
   --     Put_Line("The Value of X is " & X'Image & " in Scientific notation");
   --     Put_Line("The size of X is " & X'Size'Image);
   --     Put_Line("The size of Long_X is " & Long_X'Size'Image);
   --     Put_Line("The size of Long_Long_X is " & Long_Long_X'Size'Image);
   --  end;

   --Sampe 3 : Show Floats in Human Readable Form
   --  declare
   --     --Good practice to use constant if I dont change is value
   --     X : constant Float := -3.14159;
   --  begin
   --     Put("The value of X in a human readable form is ");
   --     --The next Put is not the same as the previous one
   --     --This is called overloading
   --     --Same Method Name, different Parameters
   --     Put(X, Fore => 1, Aft => 4, Exp => 0);
   --     New_Line;
   --     Put_Line(Item => "This is a new Line");
   --  end;

   ---Sample 4 : Floating Point Precission
   --  declare
   --     X : Float := 0.0;
   --     I : Integer := 1;
   --  begin
   --     for I in 1..10 loop
   --        X := X + 0.1;
   --     end loop;
   --
   --     Put("The Value of X is ");
   --     Put(X, Fore => 1, Aft => 10, Exp => 0);
   --     New_Line;
   --
   --     if X = 1.0 then
   --        Put_Line("They Are Equals");
   --     else
   --        Put_Line("They are not Equals");
   --     end if;
   --  end;

   -- Sample 5 - Fixec Point Decimal Variables
   --  declare
   --     type Money is delta 0.1 digits 10;
   --
   --     X : Money := 0.0;
   --     I : Integer := 1;
   --  begin
   --     for I in 1..10 loop
   --        X := X + 0.1;
   --     end loop;
   --
   --     Put("The Value of X is");
   --     Put(X'Image);
   --     New_Line;
   --
   --     if X = 1.0 then
   --        Put_Line("They Are Equals");
   --     else
   --        Put_Line("They are not Equals");
   --     end if;
   --  end;

   -- Sample 5 - Integer to Float Conversion
   --  declare
   --     X : Float := 0.0;
   --     I : Integer := 0;
   --  begin
   --     --Implicit Conversions are not Allowed in ADA
   --     --X := I;
   --
   --     X := Float(I);
   --     Put("The Value of X is ");
   --     Put(X, Fore => 1, Aft => 10, Exp => 0);
   --     New_Line;
--  end;

   -- Sample 6 - Procedures
   --  declare
   --     X : Float   := 0.0;
   --     I : Integer := 0;
   --
   --     procedure Show_Float_In_Human_Readable_Form
   --       (Message : String; Number : Float)
   --     is
   --     begin
   --        Put (Message);
   --        Put (Number, Fore => 1, Aft => 10, Exp => 0);
   --        New_Line;
   --     end Show_Float_In_Human_Readable_Form;
   --
   --  begin
   --     --Implicit Conversions are not Allowed in ADA
   --     --X := I;
   --     X := Float (I);
   --     Show_Float_In_Human_Readable_Form ("The Value of X is ", X);
   --  end;

   -- Sample 7 - Operator overloading
   --  declare
   --     X : constant Float := 5.67;
   --     Message : String := "The Number Is";
   --
   --     function "&"(Item : String; Number : Float) return String is
   --     begin
   --        return Item & Number'Image;
   --     end;
   --
   --  begin
   --     Put_Line(Message & X);
   --  end;

   --  -- Sample 7.5 - Operator overloading. Show Human Readable
   --  declare
   --     X : constant Float := 5.67;
   --     Message : String := "The Number Is";
   --
   --     function "&"(Item : String; Number : Float) return String is
   --     begin
   --        return Item & Ada.Float_Text_IO.Image(Number,Fore => 1, Aft => 10, Exp => 0);
   --     end;
   --
   --  begin
   --     Put_Line(Message & X);
   --  end;

   --  -- Sample 8 - Float To Integer Conversion
   --  declare
   --     X : Float := 3.6;
   --     I : Integer := 0;
   --  begin
   --     I := Integer(X);
   --     --I := Integer(Float'Rounding(X));
   --     Put_Line("The Value of I after de Conversion is " & I'Image);
   --  end;

   -- Sample 9 - Default parameters
   --  declare
   --     function Incrent_by
   --       (Value : Integer; Increment : Integer := 1) return Integer
   --     is
   --     begin
   --        return Value + Increment;
   --     end Incrent_by;
   --
   --     X : Integer := 1;
   --  begin
   --     Put_Line ("X is" & X'Image);
   --     X := Incrent_by (X, 2);
   --     Put_Line ("Now X is" & X'Image);
   --     X := Incrent_by (X);
   --     Put_Line ("Now X is" & X'Image);
   --  end;

   -- Sample 10 - Named Parameters
   --  declare
   --
   --     procedure Draw_Rectangle
   --       (Width : Positive; Height : Positive; FillWith : Character := '*')
   --     is
   --     begin
   --        for Row in 1 .. Width loop
   --           for Col in 1 .. Height loop
   --              Put (FillWith);
   --           end loop;
   --           New_Line;
   --        end loop;
   --     end Draw_Rectangle;
   --
   --  begin
   --     Draw_Rectangle (Height => 8, Width => 6);
   --  end;

   -- Sample 10 - Named Parameters
   --  declare
   --
   --     procedure Draw_Rectangle
   --       (Width : Positive; Height : Positive; FillWith : Character := '*')
   --     is
   --     begin
   --        for Row in 1 .. Width loop
   --           for Col in 1 .. Height loop
   --              Put (FillWith);
   --           end loop;
   --           New_Line;
   --        end loop;
   --     end Draw_Rectangle;
   --
   --  begin
   --     Draw_Rectangle (Height => 8, Width => 6);
   --  end;

   -- Sample 11 - In Out Parameters
   --  declare
   --     procedure Swap
   --       (First_Value : in out Integer; Second_Value : in out Integer)
   --     is
   --        Aux : Integer := First_Value;
   --     begin
   --        First_Value  := Second_Value;
   --        Second_Value := Aux;
   --     end Swap;
   --
   --     I : Integer := 2;
   --     J : Integer := 3;
   --  begin
   --     Put_Line ("Number I and J before Swap are " & I'Image & J'Image);
   --     Swap (I, J);
   --     Put_Line ("Number I and J before Swap are " & I'Image & J'Image);
   --  end;

   -- Sample 11 - Out Parameters and error handling good practice
   declare
      procedure Integer_Division(Dividend : in Integer; Divisor : in Integer; Result : out Integer; Success : out Boolean) is
      begin
         if Divisor = 0 then
            Success := False;
            Result := Integer'Last;
         else
            Success := True;
            Result := Dividend / Divisor;
         end if;
      end Integer_Division;

      X : Integer := 4;
      Y : Integer := 2;
      Result : Integer := 0;
      Ok : Boolean := False;
   begin
      --This is a good practice, most functions show include an out success
      --if they can fail
      Integer_Division(X, Y, Result, Ok);
      if Ok then
         Put_Line(X'Image & " divided by" & Y'Image & " is " & Result'Image);
      else
         Put_Line("You cannot divide " & X'Image & " by" & Y'Image);
      end if;

   end;


end Main;
