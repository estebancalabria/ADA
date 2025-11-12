with Ada.Text_IO; use Ada.Text_IO;
with Custom_Constants;
with Demo_Subtypes; use Demo_Subtypes;
with Fruits; use Fruits;
with distance; use distance;

procedure Main is

begin
   Put_Line(Custom_Constants.Application_Title);

   -- Sample 1: Using custom subtypes
   --  declare
   --     --Your_Age : Age := 456; --Runtime Error : Adding a Value outside its Rage. CONSTRAINT_ERROR
   --     Your_Age : Age := 45; --Runtime Error : Adding a Value outside its Rage. CONSTRAINT_ERROR
   --     Just_A_Number : Integer := 30;
   --     Son_Age : Age_Underage := 0;
   --  begin
   --     Your_Age := Just_A_Number; --Age type is compatible with Integer so this assignation is Valid
   --
   --     begin
   --       Son_Age := Your_Age;  -- Compiler Warning
   --     exception
   --        when Constraint_Error => Son_Age := Age_Underage'Last;
   --     end;
   --
   --     --if (Son_Age in Age_Underage) then
   --     if (Son_Age'Valid) then
   --        Put_Line("My son is undergage as Expected");
   --     end if;
   --
   --
   --     Put_Line("Yor age is " & To_String(Your_Age));
   --  end;

   --Sample 2 : new Types
   --USING YOUR NEW TYPES IS GOOD PRACTIVA
   --  declare
   --     Apples_In_Tree : Apples := 1;
   --     Pears_In_Bag : Pears := 2;
   --     Just_A_Number : Integer := 12;
   --  begin
   --
   --     --is Not Valid
   --     --Checked at compile time
   --     --Pears_In_Bag := Apples_In_Tree;
   --
   --     --is Not Valid
   --     --Checked at compile time
   --     --Pears_In_Bag := Apples_In_Tree;
   --     --IT was VALID with subtypes
   --     Apples_In_Tree := Just_A_Number;
   --
   --     Put_Line("In my tree I have " & To_String(Apples_In_Tree));
   --     Put_Line("In my bag I have " & To_String(Pears_In_Bag));
   --     Put_Line("I Cannot mix pears and apples in the same variable");
   --  end;

   --Sample 3 : Real World example on using new types
   --  declare
   --     Distance_From_Home : Meters := 1000.0;
   --     Distance_From_Usa : Kilometers := 2345.0;
   --     Distance_From_Home_In_USA : Meters := 0.0;
   --     Random_Float : Float := 5.5;
   --  begin
   --     --Not allowed at compile time
   --     -- Distance_From_Home :=  Distance_From_Usa;
   --
   --     --Not allowed at compile time
   --     --Distance_From_Usa := Random_Float;
   --
   --     --Canot use this for n o
   --     Distance_From_Home_In_USA :=  Distance_From_Home + Distance_From_Usa;
   --     Put_Line("The distance from my home to USA is "  & To_String(Distance_From_Home_In_USA));
   --  end;

   --Sample 4 - Dynamic PRaccates
   --  declare
   --     --subtype Even_integer is Integer with Dynamic_Predicate => Even_integer mod 2 = 0;
   --     type Even_integer is new Integer with Dynamic_Predicate => Even_integer mod 2 = 0;
   --
   --     Number : Integer := 2;
   --     Even_Number : Even_integer;
   --  begin
   --     Even_Number := 3; --This fails if we execute the program with special flags
   --
   --     if (Even_Number in Even_integer) then
   --       Put_Line("Everything is OK");
   --     else
   --       Put_Line("Variable is Wrong");
   --     end if;
   --  end;
   --
   --Sample 4 - Dynamic Predicates
   --  declare
   --     --subtype Even_integer is Integer with Dynamic_Predicate => Even_integer mod 2 = 0;
   --     type One_To_Ten is new Integer range 1..10;
   --     type One_To_Ten_Even is new One_To_Ten
   --       with Static_Predicate => One_To_Ten_Even  in 2|4|6|8|10;
   --
   --     Number : One_To_Ten_Even :=2;
   --  begin
   --     Number := 3;
   --
   --     if (Number in One_To_Ten_Even) then
   --       Put_Line("Everything is OK");
   --     else
   --       Put_Line("Variable is Wrong");
   --     end if;
   --  end;


   -- Sample 5 - Arrays
   --  declare
   --     My_array : Array (1..5) of Integer;
   --  begin
   --     My_array := (11,22,33,44,55);
   --     for I in 1..5 loop
   --        Put_Line("Position:" & I'Image & ", Value: " & My_array(I)'Image);
   --      end loop;
   --  end;

   -- Sample 6 - More on Arrays
   declare
      type My_array_range is range 1..25;
      --My_array : Array (1..25) of Integer := (others => 0);
      My_array : Array (My_array_range) of Integer := (others => 0);
   begin
      My_array := (11,22,33,44,55, others => 999);

      --IMPORTANT USE 'First and 'Last to iterate on an Array by Index
      for I in My_array'First..My_array'Last loop

         Put_Line("Position:" & I'Image & ", Value: " & My_array(I)'Image);

       end loop;
   end;




end Main;
