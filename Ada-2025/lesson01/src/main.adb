with Ada.Text_IO;
use
  Ada
    .Text_IO; --I put use to avoid repeating Ada.Text_IO.Put_Line("Hello World");

procedure Main is
--decare section
--   I : Integer;
begin

--     -- Sample 001 - Hellow Worlkd
--
--     --without use
--     Ada.Text_IO.Put_Line ("Hello World");
--     --with use you can just call the method without the package
--     Put_Line ("Hello World");
--
--     -- Sample 002: Variable Declaration and Assignation
--
--     --In JAVA: System.out.println("Hello World");
--     --Python: print("Hello World");
--     -- & is the contactenation Operators
--     -- := Asignation operator
--     --  ' Used to call an attibute
--     -- Integer`Image(I) ist like toString in other Languages
--     -- Image is an attribute of the type Integer
--
--     I := 10;
--     Put_Line
--       ("I declared my first Integer Variable and its value is " &
--        Integer'Image (I));
--
--     -- Sample 003 - Declarative Sections
--     declare
--        New_Variable : Integer;
--     begin
--        New_Variable := 23;
--        Put_Line
--          ("I declared my second Integer Variable in a declare section and its value is " &
--           Integer'Image (New_Variable));
--     end;
--     --New_Variable := 23;  -- This will give an error because the Variable is no longuer declared
--
--     -- Sample 004 - Working with tipes
--     declare
--        --Initializing the variable on declaration (GGOD PRACTIVE)
--        Number : Integer := 10;
--        --Positive_Number : Positive;
--     begin
--        if (Number in Positive)
--        then          --IN (belongs) operator wich is a set operator
--           Put_Line ("Number is Positive");
--        end if;
--
--        if (Number = 10) then
--           Put_Line ("Number is 10");
--        end if;
--
--        --ositive_Number := Number - 10; --Runtine Time
--
--        Put_Line ("Reached This Line");
--     end;
--
--     -- Sample 005 : Catching Exceptions
--     declare
--        A_Number       : Integer := 10;
--        Another_Number : Positive;
--     begin
--
--  --      begin
--        Another_Number := A_Number - 30;
--     exception
--        when Constraint_Error =>
--           Put_Line ("The Variable Another_Number cannot hold NEgativa Numbers");
--           --    end;
--  --  --  --  --  --     end;

   --  --Sample 006 - Different Types
   --  declare
   --     I : Integer  := -10;
   --     P : Positive := 1;
   --     N : Natural  := 0;
   --  begin
   --     Put_Line
   --       ("The type Integer goes from " & Integer'First'Image & " to " &
   --        Integer'Last'Image & " memory : " & Integer'Size'Image & " bytes");
   --
   --     Put_Line
   --       ("The type Positive goes from " & Positive'First'Image & " to " &
   --        Positive'Last'Image & " memory " & Positive'Size'Image & " bytes");
   --
   --     Put_Line
   --       ("The type Natutal goes from " & Natural'Image (Natural'First) &
   --        " to " & Natural'Image (Natural'Last)  & " memory " & Natural'Size'Image & " bytes");
   --  end;

   -- Sample 007 - Declarin enumeration types
   declare
      type Days_Of_The_Week is (Monday, Tuesday, Wednesday, Thursday, Friday);

      Which_Day_Is_Today : Days_Of_The_Week;

   begin
      for Day in Days_Of_The_Week loop
         Put_Line(Days_Of_The_Week'Pos(Day)'Image & " - " & Day'Image);
      end loop;

      Which_Day_Is_Today := Monday;

      Put_Line("Today is " & Which_Day_Is_Today'Image);
   end;



end Main;
